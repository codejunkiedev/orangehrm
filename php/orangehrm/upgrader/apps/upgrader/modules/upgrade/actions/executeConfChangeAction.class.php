<?php

class executeConfChangeAction extends sfAction {
    
    private $selfConfigPath;
    private $remortConfigPath;
    public function preExecute() {
        $this->getUser()->setAttribute('currentScreen','confInfo');
        $this->applicationRootPath = sfConfig::get('sf_root_dir')."/..";
    }
    
    public function execute($request) {
        $this->form = new ConfigureFile();
        $this->confFileCreted = array('Pending', 'Pending');
        $this->buttonState = "Start";
        if ($request->isMethod('post')) {
            if($request->getParameter('sumbitButton') == 'Proceed') {
                $this->getRequest()->setParameter('submitBy', 'confFile');
                $this->forward('upgrade','index');
            }
            $this->form->bind($request->getParameter('configureFile'));
            if ($this->form->isValid()) {
                $upgraderUtility = new UpgradeUtility();
                $dbInfo = $this->getUser()->getAttribute('dbInfo');
                $host = $dbInfo['host'];
                $username = $dbInfo['username'];
                $password = $dbInfo['password'];
                $port = $dbInfo['port'];
                $database = $dbInfo['database'];
                
                $upgraderUtility->setApplicationRootPath($this->applicationRootPath);
                $result[] = $upgraderUtility->writeConfFile($host, $port, $database, $username, $password);
                $result[] = $upgraderUtility->writeSymfonyDbConfigFile($host, $port, $database, $username, $password);
                if ($result[0]) {
                    $this->confFileCreted[0] = 'Done';
                }
                if ($result[1]) {
                    $this->confFileCreted[1] = 'Done';
                }
                $success = true;
                foreach ($result as $res) {
                    if (!$res) {
                        $success = false;
                        break;
                    }
                }
                if ($success) {
                    $this->buttonState = 'Proceed';
                    $upgraderUtility->getDbConnection($host, $username, $password, $database, $port);
                    $upgraderUtility->dropUpgradeStatusTable();
                    $fromVersion = $this->getUser()->getAttribute('startVersion');
                    $toVersion = $this->getUser()->getAttribute('endVersion');
                    $fromIncrement = $this->getUser()->getAttribute('startIncrementer');
                    $toIncrement = $this->getUser()->getAttribute('endIncrementer');
                    $date = gmdate("Y-m-d H:i:s", time());
                    $result = $upgraderUtility->insertUpgradeHistory($fromVersion, $toVersion, $fromIncrement, $toIncrement, $date);
                }
            }
        }
    }
}