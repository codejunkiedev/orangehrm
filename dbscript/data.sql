create table hs_hr_config (
	key varchar(100) not null default '',
	value varchar(512) not null default '',
	primary key (key)
);

create table ohrm_employment_status (
	id SERIAL,
	name varchar(60) not null,
  primary key  (id)
);

create table ohrm_job_category (
	id SERIAL,
	name varchar(60) default null,
  primary key  (id)
);

create table hs_hr_jobtit_empstat (
	jobtit_code int not null,
	estat_code int not null,
  primary key  (jobtit_code,estat_code)
);

create table hs_hr_country (
  cou_code char(2) not null default '',
  name varchar(80) not null default '',
  cou_name varchar(80) not null default '',
  iso3 char(3) default null,
  numcode smallint default null,
  primary key  (cou_code)
);

create table hs_hr_currency_type (
  code int not null default '0',
  currency_id char(3) not null default '',
  currency_name varchar(70) not null default '',
  primary key  (currency_id)
);

create table ohrm_license (
	id SERIAL,
	name varchar(100) not null,
  primary key  (id)
);

create table hs_hr_district (
  district_code varchar(13) not null default '',
  district_name varchar(50) default null,
  province_code varchar(13) default null,
  primary key  (district_code)
);

create table hs_hr_payperiod (
  payperiod_code varchar(13) not null default '',
  payperiod_name varchar(100) default null,
  primary key  (payperiod_code)
);

create table hs_hr_emp_basicsalary (
  id INT AUTO_INCREMENT,
  emp_number int not null default 0,
  sal_grd_code int default null,
  currency_id varchar(6) not null default '',
  ebsal_basic_salary VARCHAR(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT null,
  payperiod_code varchar(13) default null,
  salary_component varchar(100),
  comments varchar(255),
  primary key  (id)
);

create table hs_hr_emp_contract_extend (
  emp_number int not null default 0,
  econ_extend_id decimal(10,0) not null default '0',
  econ_extend_start_date datetime default null,
  econ_extend_end_date datetime default null,
  primary key  (emp_number,econ_extend_id)
);


create table hs_hr_emp_language (
  emp_number int not null default 0,
  lang_id int not null,
  fluency smallint default '0',
  competency smallint default '0',
  comments varchar(100),
  primary key  (emp_number,lang_id,fluency)
);

create table hs_hr_emp_us_tax (
  emp_number int not null default 0,
  tax_federal_status varchar(13) default null,
  tax_federal_exceptions int default 0,
  tax_state varchar(13) default null,
  tax_state_status varchar(13) default null,
  tax_state_exceptions int default 0,
  tax_unemp_state varchar(13) default null,
  tax_work_state varchar(13) default null,
  primary key  (emp_number)
);

create table hs_hr_emp_attachment (
  emp_number int not null default 0,
  eattach_id int not null default '0',
  eattach_desc varchar(200) default null,
  eattach_filename varchar(100) default null,
  eattach_size int default '0',
  eattach_attachment mediumblob,
  eattach_type varchar(200) default null,
  screen varchar(100) default '',
  attached_by int default null,
  attached_by_name varchar(200),
  attached_time timestamp default now(),
  primary key  (emp_number,eattach_id),
  key screen (screen)
);


create table hs_hr_emp_children (
  emp_number int not null default 0,
  ec_seqno decimal(2,0) not null default '0',
  ec_name varchar(100) default '',
  ec_date_of_birth date null default null,
  primary key  (emp_number,ec_seqno)
);

create table hs_hr_emp_dependents (
  emp_number int not null default 0,
  ed_seqno decimal(2,0) not null default '0',
  ed_name varchar(100) default '',
  ed_relationship_type ENUM('child', 'other'),
  ed_relationship varchar(100) default '',
  ed_date_of_birth date null default null,
  primary key  (emp_number,ed_seqno)
);

create table hs_hr_emp_emergency_contacts (
  emp_number int not null default 0,
  eec_seqno decimal(2,0) not null default '0',
  eec_name varchar(100) default '',
  eec_relationship varchar(100) default '',
  eec_home_no varchar(100) default '',
  eec_mobile_no varchar(100) default '',
  eec_office_no varchar(100) default '',
  primary key  (emp_number,eec_seqno)
);


create table hs_hr_emp_history_of_ealier_pos (
  emp_number int not null default 0,
  emp_seqno decimal(2,0) not null default '0',
  ehoep_job_title varchar(100) default '',
  ehoep_years varchar(100) default '',
  primary key  (emp_number,emp_seqno)
);


create table ohrm_emp_license (
  emp_number int not null,
  license_id int not null,
  license_no varchar(50) default null,
  license_issued_date date null default null,
  license_expiry_date date null default null,
  primary key (emp_number,license_id)
);


create table hs_hr_emp_member_detail (
  id int AUTO_INCREMENT,
  emp_number int not null default 0,
  membship_code int not null default 0,
  ememb_subscript_ownership varchar(20) default null,
  ememb_subscript_amount decimal(15,2) default null,
  ememb_subs_currency varchar(20) default null,
  ememb_commence_date date default null,
  ememb_renewal_date date default null,
  primary key  (id)
);


create table hs_hr_emp_passport (
  emp_number int not null default 0,
  ep_seqno decimal(2,0) not null default '0',
  ep_passport_num varchar(100) not null default '',
  ep_passportissueddate datetime default null,
  ep_passportexpiredate datetime default null,
  ep_comments varchar(255) default null,
  ep_passport_type_flg smallint default null,
  ep_i9_status varchar(100) default '',
  ep_i9_review_date date null default null,
  cou_code varchar(6) default null,
  primary key  (emp_number,ep_seqno)
);

create table hs_hr_emp_directdebit (
  id INT AUTO_INCREMENT,
  salary_id INT NOT NULL,
  dd_routing_num int not null,
  dd_account varchar(100) not null default '',
  dd_amount decimal(11,2) not null,
  dd_account_type varchar(20) not null default '' comment 'CHECKING, SAVINGS',
  dd_transaction_type varchar(20) not null default '' comment 'BLANK, PERC, FLAT, FLATMINUS',
  primary key  (id)
);

create table hs_hr_emp_skill (
  emp_number int not null default 0,
  skill_id int not null,
  years_of_exp decimal(2,0) default null,
  comments varchar(100) not null default ''
);

create table hs_hr_emp_picture (
  emp_number int not null default 0,
  epic_picture mediumblob,
  epic_filename varchar(100) default null,
  epic_type varchar(50) default null,
  epic_file_size varchar(20) default null,
  epic_file_width varchar(20) default null,
  epic_file_height varchar(20) default null,
  primary key  (emp_number)
);


create table ohrm_emp_education (
  id SERIAL,
  emp_number int not null,
  education_id int not null,
  institute varchar(100) default null,
  major varchar(100) default null,
  year decimal(4,0) default null,
  score varchar(25) default null,
  start_date date default null,
  end_date date default null,
  primary key  (id)
);


create table hs_hr_emp_reportto (
  erep_sup_emp_number int not null default 0,
  erep_sub_emp_number int not null default 0,
  erep_reporting_mode int not null default 0,
  primary key  (erep_sup_emp_number,erep_sub_emp_number, erep_reporting_mode)
);

create table ohrm_emp_reporting_method (
  reporting_method_id int not null auto_increment,
  reporting_method_name varchar(100) not null,
  primary key  (reporting_method_id)
);

create table hs_hr_emp_work_experience (
  emp_number int not null default 0,
  eexp_seqno decimal(10,0) not null default '0',
  eexp_employer varchar(100) default null,
  eexp_jobtit varchar(120) default null,
  eexp_from_date datetime default null,
  eexp_to_date datetime default null,
  eexp_comments varchar(200) default null,
  eexp_internal int default null,
  primary key  (emp_number,eexp_seqno)
);


create table hs_hr_employee (
  emp_number int not null auto_increment,
  employee_id varchar(50) default null,
  emp_lastname varchar(100) default '' not null,
  emp_firstname varchar(100) default '' not null,
  emp_middle_name varchar(100) default '' not null,
  emp_nick_name varchar(100) default '',
  emp_smoker smallint default '0',
  ethnic_race_code varchar(13) default null,
  emp_birthday date null default null,
  nation_code int default null,
  emp_gender smallint default null,
  emp_marital_status varchar(20) default null,
  emp_ssn_num varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  emp_sin_num varchar(100) default '',
  emp_other_id varchar(100) default '',
  emp_dri_lice_num varchar(100) default '',
  emp_dri_lice_exp_date date null default null,
  emp_military_service varchar(100) default '',
  emp_status int default null,
  job_title_code int default null,
  eeo_cat_code int default null,
  work_station int default null,
  emp_street1 varchar(100) default '',
  emp_street2 varchar(100) default '',
  city_code varchar(100) default '',
  coun_code varchar(100) default '',
  provin_code varchar(100) default '',
  emp_zipcode varchar(20) default null,
  emp_hm_telephone varchar(50) default null,
  emp_mobile varchar(50) default null,
  emp_work_telephone varchar(50) default null,
  emp_work_email varchar(50) default null,
  sal_grd_code varchar(13) default null,
  joined_date date null default null,
  emp_oth_email varchar(50) default null,
  termination_id int default null,
  custom1 varchar(250) default null,
  custom2 varchar(250) default null,
  custom3 varchar(250) default null,
  custom4 varchar(250) default null,
  custom5 varchar(250) default null,
  custom6 varchar(250) default null,
  custom7 varchar(250) default null,
  custom8 varchar(250) default null,
  custom9 varchar(250) default null,
  custom10 varchar(250) default null,
  purged_at TIMESTAMP NULL DEFAULT NULL,

  primary key  (emp_number)
);

create table ohrm_language (
  id SERIAL,
  name varchar(120) default null,
  primary key  (id)
);


create table ohrm_location (
  id SERIAL,
  name varchar(110) not null,
  country_code varchar(3) not null,
  province varchar(60) default null,
  city varchar(60) default null,
  address varchar(255) default null,
  zip_code varchar(35) default null,
  phone varchar(35) default null,
  fax varchar(35) default null,
  notes varchar(255) default null,
  primary key  (id)
);

CREATE  TABLE ohrm_operational_country (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  country_code CHAR(2) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

create table hs_hr_module (
  mod_id varchar(36) not null default '',
  name varchar(45) default null,
  owner varchar(45) default null,
  owner_email varchar(100) default null,
  version varchar(36) default null,
  description text,
  primary key  (mod_id)
);

create table hs_hr_province (
  id int not null auto_increment,
  province_name varchar(40) not null default '',
  province_code char(2) not null default '',
  cou_code char(2) not null default 'us',
  primary key  (id)
);

create table ohrm_education (
	id SERIAL,
	name varchar(100) not null,
	primary key (id)
);

create table ohrm_skill (
  id SERIAL,
  name varchar(120) default null,
  description text default null,
  primary key  (id)
);

create table ohrm_pay_grade_currency (
  pay_grade_id int not null ,
  currency_id varchar(6) not null default '',
  min_salary double default null,
  max_salary double default null,
  primary key  (pay_grade_id,currency_id)
);

create table ohrm_pay_grade (
  id SERIAL,
  name varchar(60) default null unique,
  primary key  (id)
);

CREATE TABLE ohrm_holiday (
  id INT UNSIGNED AUTO_INCREMENT,
  description TEXT DEFAULT NULL,
  date DATE DEFAULT NULL,
  recurring TINYINT UNSIGNED DEFAULT 0,
  length INT UNSIGNED DEFAULT NULL,
  operational_country_id INT UNSIGNED DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE  TABLE IF NOT EXISTS ohrm_work_week (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  operational_country_id int UNSIGNED NULL DEFAULT NULL ,
  mon TINYINT UNSIGNED NOT NULL DEFAULT 0 ,
  tue TINYINT UNSIGNED NOT NULL DEFAULT 0 ,
  wed TINYINT UNSIGNED NOT NULL DEFAULT 0 ,
  thu TINYINT UNSIGNED NOT NULL DEFAULT 0 ,
  fri TINYINT UNSIGNED NOT NULL DEFAULT 0 ,
  sat TINYINT UNSIGNED NOT NULL DEFAULT 0 ,
  sun TINYINT UNSIGNED NOT NULL DEFAULT 0 ,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

create table hs_hr_mailnotifications (
	user_id int not null,
	notification_type_id int not null ,
	status int not null,
    email varchar(100) default null,
	KEY user_id (user_id),
	KEY notification_type_id (notification_type_id)
);

create table ohrm_customer (
  customer_id int not null auto_increment,
  name varchar(100) not null,
  description varchar(255) default null,
  is_deleted tinyint default 0,
  primary key  (customer_id)
);

create table ohrm_project (
  project_id int not null auto_increment,
  customer_id int not null,
  name varchar(100) default null,
  description varchar(256) default null,
  is_deleted tinyint default 0,
  primary key  (project_id,customer_id),
  key customer_id (customer_id)
);

create table ohrm_project_activity (
  activity_id int not null auto_increment,
  project_id int not null,
  name varchar(110) default null,
  is_deleted tinyint default 0,
  primary key  (activity_id),
  key project_id (project_id)
);

create table ohrm_project_admin (
  project_id int not null,
  emp_number int not null,
  primary key  (project_id,emp_number),
  key emp_number (emp_number)
);

create table hs_hr_unique_id (
  id SERIAL,
  last_id int unsigned not null,
  table_name varchar(50) not null,
  field_name varchar(50) not null,
  primary key(id),
  unique key table_field (table_name, field_name)
);

create table ohrm_work_shift (
  id int not null auto_increment,
  name varchar(250) not null,
  hours_per_day decimal(4,2) not null,
  start_time time not null,
  end_time time not null,
  primary key  (id)
);

create table ohrm_employee_work_shift (
  work_shift_id int not null auto_increment,
  emp_number int not null,
  primary key  (work_shift_id,emp_number),
  key emp_number (emp_number)
);

create table hs_hr_custom_fields (
  field_num int not null,
  name varchar(250) not null,
  type int not null,
  screen varchar(100),
  extra_data varchar(250) default null,
  primary key  (field_num),
  key emp_number (field_num),
  key screen (screen)
);

create table hs_hr_pay_period (
	id int not null ,
	start_date date not null ,
	end_date date not null ,
	close_date date not null ,
	check_date date not null ,
	timesheet_aproval_due_date date not null ,
	primary key (id)
);

create table hs_hr_custom_export (
  export_id int not null,
  name varchar(250) not null,
  fields text default null,
  headings text default null,
  primary key  (export_id),
  key emp_number (export_id)
);

create table hs_hr_custom_import (
  import_id int not null,
  name varchar(250) not null,
  fields text default null,
  has_heading tinyint default 0,
  primary key  (import_id),
  key emp_number (import_id)
);

create table hs_hr_emp_locations (
  emp_number int not null,
  location_id int not null,
  primary key  (emp_number, location_id)
);

create table ohrm_timesheet(
  timesheet_id bigint not null auto_increment,
  state varchar(255) not null,
  start_date date not null,
  end_date date not null,
  employee_id bigint not null,
  primary key  (timesheet_id)
);

create table ohrm_timesheet_item(
  timesheet_item_id bigint not null auto_increment,
  timesheet_id bigint not null,
  date date not null,
  duration bigint default null,
  comment text default null,
  project_id bigint not null,
  employee_id bigint not null,
  activity_id bigint not null,
  primary key  (timesheet_item_id),
  key timesheet_id (timesheet_id),
  key activity_id (activity_id)
);

create table ohrm_timesheet_action_log(
  timesheet_action_log_id bigint not null auto_increment,
  comment varchar(255) default null,
  action varchar(255),
  date_time date not null,
  performed_by int not null,
  timesheet_id bigint not null,
  primary key  (timesheet_action_log_id),
  key timesheet_id (timesheet_id),
  key performed_by(performed_by)
);

create table ohrm_workflow_state_machine(
  id bigint not null auto_increment,
  workflow varchar(255) not null,
  state varchar(255) not null,
  role varchar(255) not null,
  action varchar(255) not null,
  resulting_state varchar(255) not null,
  roles_to_notify text,
  priority int not null default 0 COMMENT 'lowest priority 0',
  primary key (id)
);

create table ohrm_attendance_record(
  id bigint not null auto_increment,
  employee_id bigint not null,
  punch_in_utc_time datetime ,
  punch_in_note varchar(255),
  punch_in_time_offset varchar(255),
  punch_in_user_time datetime,
  punch_out_utc_time datetime,
  punch_out_note varchar(255),
  punch_out_time_offset varchar(255),
  punch_out_user_time datetime,
  state varchar(255) not null,
  primary key (id),
  KEY emp_id_state (employee_id,state),
  KEY emp_id_time (employee_id,punch_in_utc_time,punch_out_utc_time)
);

create table ohrm_report_group (
  report_group_id bigint not null,
  name varchar(255) not null,
  core_sql mediumtext not null,
  primary key (report_group_id)
);

create table ohrm_report (
  report_id bigint not null auto_increment,
  name varchar(255) not null,
  report_group_id bigint not null,
  use_filter_field boolean not null,
  type varchar(255) default null,
  primary key (report_id),
  key report_group_id (report_group_id)
);

create table ohrm_filter_field (
  filter_field_id bigint not null,
  report_group_id bigint not null,
  name varchar(255) not null,
  where_clause_part mediumtext not null,
  filter_field_widget varchar(255),
  condition_no int not null,
  required varchar(10) default null,
  primary key (filter_field_id),
  key report_group_id (report_group_id)
);

create table ohrm_selected_filter_field (
  report_id bigint not null,
  filter_field_id bigint not null,
  filter_field_order bigint not null,
  value1 varchar(255) default null,
  value2 varchar(255) default null,
  where_condition varchar(255) default null,
  type varchar(255) not null,
  primary key (report_id,filter_field_id),
  key report_id (report_id),
  key filter_field_id (filter_field_id)
);

create table ohrm_display_field (
  display_field_id bigint not null auto_increment,
  report_group_id bigint not null,
  name varchar(255) not null,
  label varchar(255) not null,
  field_alias varchar(255),
  is_sortable varchar(10) not null,
  sort_order varchar(255),
  sort_field varchar(255),
  element_type varchar(255) not null,
  element_property varchar(1000) not null,
  width varchar(255) not null,
  is_exportable varchar(10),
  text_alignment_style varchar(20),
  is_value_list boolean not null default false,
  display_field_group_id int unsigned,
  default_value varchar(255) default null,
  is_encrypted boolean not null default false,
  is_meta boolean not null default false,
  primary key (display_field_id),
  key report_group_id (report_group_id)
);

create table ohrm_composite_display_field (
  composite_display_field_id bigint not null auto_increment,
  report_group_id bigint not null,
  name varchar(1000) not null,
  label varchar(255) not null,
  field_alias varchar(255),
  is_sortable varchar(10) not null,
  sort_order varchar(255),
  sort_field varchar(255),
  element_type varchar(255) not null,
  element_property varchar(1000) not null,
  width varchar(255) not null,
  is_exportable varchar(10),
  text_alignment_style varchar(20),
  is_value_list boolean not null default false,
  display_field_group_id int unsigned,
  default_value varchar(255) default null,
  is_encrypted boolean not null default false,
  is_meta boolean not null default false,
  primary key (composite_display_field_id),
  key report_group_id (report_group_id)
);

create table ohrm_group_field (
  group_field_id bigint not null,
  name varchar(255) not null,
  group_by_clause mediumtext not null,
  group_field_widget varchar(255),
  primary key (group_field_id)
);

create table ohrm_available_group_field (
  report_group_id bigint not null,
  group_field_id bigint not null,
  primary key (report_group_id,group_field_id),
  key report_group_id (report_group_id),
  key group_field_id (group_field_id)
);

create table ohrm_selected_display_field (
  id bigint not null auto_increment,
  display_field_id bigint not null,
  report_id bigint not null,
  primary key (id,display_field_id,report_id),
  key display_field_id (display_field_id),
  key report_id (report_id)
);

create table ohrm_selected_composite_display_field (
  id bigint not null,
  composite_display_field_id bigint not null,
  report_id bigint not null,
  primary key (id,composite_display_field_id,report_id),
  key composite_display_field_id (composite_display_field_id),
  key report_id (report_id)
);

create table ohrm_summary_display_field (
  summary_display_field_id bigint not null,
  function varchar(1000) not null,
  label varchar(255) not null,
  field_alias varchar(255),
  is_sortable varchar(10) not null,
  sort_order varchar(255),
  sort_field varchar(255),
  element_type varchar(255) not null,
  element_property varchar(1000) not null,
  width varchar(255) not null,
  is_exportable varchar(10),
  text_alignment_style varchar(20),
  is_value_list boolean not null default false,
  display_field_group_id int unsigned,
  default_value varchar(255) default null,
  primary key (summary_display_field_id)
);

create table ohrm_selected_group_field (
  group_field_id bigint not null,
  summary_display_field_id bigint not null,
  report_id bigint not null,
  primary key (group_field_id,summary_display_field_id,report_id),
  key group_field_id (group_field_id),
  key summary_display_field_id (summary_display_field_id),
  key report_id (report_id)
);

create table ohrm_display_field_group (
  id int unsigned not null auto_increment,
  report_group_id bigint not null,
  name varchar(255) not null,
  is_list boolean not null default false,
  primary key (id)
);

create table ohrm_selected_display_field_group (
  id int unsigned not null auto_increment,
  report_id bigint not null,
  display_field_group_id int unsigned not null,
  primary key (id)
);

create table ohrm_job_vacancy(
	id int not null auto_increment,
	job_title_code int not null,
        hiring_manager_id int default null,
	name varchar(100) not null,
	description text default null,
	no_of_positions int default null,
    status int not null,
    published_in_feed boolean not null default false,
    defined_time datetime not null,
    updated_time datetime not null,
	primary key (id)
)engine=innodb default charset=utf8;

create table ohrm_job_candidate(
	id int not null auto_increment,
	first_name varchar(30) not null,
	middle_name varchar(30) default null,
    last_name varchar(30) not null,
	email varchar(100) not null,
	contact_number varchar(30) default null,
	status int not null,
	comment text default null,
	mode_of_application int not null,
	date_of_application date not null,
    cv_file_id int default null,
    cv_text_version text default null,
    keywords varchar(255) default null,
    added_person int default null,
    consent_to_keep_data boolean not null default false,
	primary key (id)
)engine=innodb default charset=utf8;

create table ohrm_job_candidate_vacancy(
        id int default null unique auto_increment,
	candidate_id int not null,
        vacancy_id int not null,
	status varchar(100) not null,
        applied_date date not null,
	primary key (candidate_id, vacancy_id)
)engine=innodb default charset=utf8;

create table ohrm_job_candidate_attachment(
	id int not null auto_increment,
	candidate_id int not null,
	file_name varchar(200) not null,
        file_type varchar(200) default null,
	file_size int not null,
	file_content mediumblob,
        attachment_type int default null,
	primary key (id)
)engine=innodb default charset=utf8;

create table ohrm_job_vacancy_attachment(
	id int not null auto_increment,
	vacancy_id int not null,
	file_name varchar(200) not null,
        file_type varchar(200) default null,
	file_size int not null,
	file_content mediumblob,
        attachment_type int default null,
	comment varchar(255) default null,
	primary key (id)
)engine=innodb default charset=utf8;

create table ohrm_job_interview_attachment(
	id int not null auto_increment,
	interview_id int not null,
	file_name varchar(200) not null,
        file_type varchar(200) default null,
	file_size int not null,
	file_content mediumblob,
        attachment_type int default null,
	comment varchar(255) default null,
	primary key (id)
)engine=innodb default charset=utf8;

create table ohrm_job_candidate_history(
	id int not null auto_increment,
	candidate_id int not null,
	vacancy_id int default null,
	candidate_vacancy_name varchar(255) default null,
	interview_id int default null,
	action int not null,
	performed_by int default null,
        performed_date datetime not null,
	note text default null,
	interviewers varchar(255) default null,
	primary key (id)
)engine=innodb default charset=utf8;

create table ohrm_job_interview(
	id int not null auto_increment,
	candidate_vacancy_id int default null,
        candidate_id int default null,
        interview_name varchar(100) not null,
	interview_date date default null,
        interview_time time default null,
	note text default null,
	primary key (id)
)engine=innodb default charset=utf8;

create table ohrm_job_interview_interviewer(
	interview_id int not null,
	interviewer_id int not null,
	primary key (interview_id, interviewer_id)
)engine=innodb default charset=utf8;

create table ohrm_subunit (
  id int not null auto_increment,
  name varchar(100) not null unique,
  unit_id varchar(100) default null,
  description varchar(400),
  lft smallint unsigned default null,
  rgt smallint unsigned default null,
  level smallint unsigned default null,
  primary key (id)
);

create table ohrm_organization_gen_info (
  id int not null auto_increment,
  name varchar(100) not null,
  tax_id varchar(30) default null,
  registration_number varchar(30) default null,
  phone varchar(30) default null,
  fax varchar(30) default null,
  email varchar(30) default null,
  country varchar(30) default null,
  province varchar(30) default null,
  city varchar(30) default null,
  zip_code varchar(30) default null,
  street1 varchar(100) default null,
  street2 varchar(100) default null,
  note varchar(255) default null,
  primary key (id)
);

create table ohrm_job_title (
  id int not null auto_increment,
  job_title varchar(100) not null,
  job_description varchar(400) default null,
  note varchar(400) default null,
  is_deleted tinyint default 0,
  primary key (id)
);

create table ohrm_job_specification_attachment(
	id int not null auto_increment,
	job_title_id int not null,
	file_name varchar(200) not null,
        file_type varchar(200) default null,
	file_size int not null,
	file_content mediumblob,
	primary key (id)
)engine=innodb default charset=utf8;

create table ohrm_emp_termination(
	id int not null auto_increment,
	emp_number int default null,
        reason_id int default null,
	termination_date date not null,
        note varchar(255) default null,
	primary key (id)
)engine=innodb default charset=utf8;

create table ohrm_emp_termination_reason(
	id int not null auto_increment,
    name varchar(100) default null,
	primary key (id)
)engine=innodb default charset=utf8;

create table ohrm_user(
        id int not null auto_increment,
        user_role_id int not null,
        emp_number int DEFAULT NULL,
        user_name varchar(40) unique,
        user_password varchar(255) DEFAULT NULL,
        deleted tinyint NOT NULL DEFAULT '0',
        status tinyint NOT NULL DEFAULT '1',
        date_entered datetime null default null,
        date_modified datetime null default null,
        modified_user_id int default null,
        created_by int default null,
        key user_role_id (user_role_id),
        key emp_number (emp_number),
        key modified_user_id(modified_user_id),
        key created_by(created_by),
	primary key (id)
)engine=innodb default charset=utf8;

create table ohrm_user_role(
	id int not null auto_increment,
	name varchar(255) not null,
	display_name varchar(255) not null,
	is_assignable tinyint default 0,
        is_predefined tinyint default 0,
        unique key user_role_name (name),
	primary key (id)
)engine=innodb default charset=utf8;

create table ohrm_user_selection_rule(
	id int not null auto_increment,
	name varchar(255) not null,
        description varchar(255) ,
	implementation_class varchar(255) not null,
        rule_xml_data text,
	primary key (id)
)engine=innodb default charset=utf8;

create table ohrm_role_user_selection_rule(
	user_role_id int not null,
        selection_rule_id int not null,
        configurable_params text,
	primary key (user_role_id,selection_rule_id)
)engine=innodb default charset=utf8;

create table ohrm_membership (
  id int not null auto_increment,
  name varchar(100) not null,
  primary key  (id)
);

create table ohrm_nationality (
  id int not null auto_increment,
  name varchar(100) not null,
  primary key  (id)
);

create table ohrm_email_notification (
  id int not null auto_increment,
  name varchar(100) not null,
  is_enable int not null,
  primary key  (id)
);

create table ohrm_email_subscriber (
  id int not null auto_increment,
  notification_id int not null,
  name varchar(100) not null,
  email varchar(100) not null,
  primary key  (id)
);

create table ohrm_email (
  id int not null auto_increment,
  name varchar(100) not null unique,
  primary key  (id),
  unique key ohrm_email_name(name)
);

create table ohrm_email_template (
  id int not null auto_increment,
  email_id int not null,
  locale varchar(20),
  performer_role varchar(50) default null,
  recipient_role varchar(50) default null,
  subject varchar(255),
  body text,
  primary key  (id)
);

create table ohrm_email_processor (
  id int not null auto_increment,
  email_id int not null,
  class_name varchar(100),
  primary key  (id)
);

create table ohrm_module (
  id SERIAL,
  name varchar(120) default null,
  status tinyint default 1,
  primary key  (id)
);

create table ohrm_screen (
  id SERIAL,
   name varchar(100) not null,
   module_id int not null,
   action_url varchar(255) not null,
   primary key (id)
);

create table ohrm_user_role_screen (
  id SERIAL,
  user_role_id int not null,
  screen_id int not null,
  can_read tinyint not null default '0',
  can_create tinyint not null default '0',
  can_update tinyint not null default '0',
  can_delete tinyint not null default '0',
  primary key (id)
);

create table ohrm_menu_item (
   id SERIAL,
   menu_title varchar(255) not null,
   screen_id int default null,
   parent_id int default null,
   level tinyint not null,
   order_hint int not null,
   url_extras varchar(255) default null,
   status tinyint not null default 1,
   primary key (id)
);

create table ohrm_upgrade_history (
  id int not null auto_increment,
  start_version varchar(30) DEFAULT NULL,
  end_version varchar(30) DEFAULT NULL,
  start_increment int NOT NULL,
  end_increment int NOT NULL,
  upgraded_date datetime DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


create table ohrm_email_configuration (
  id int not null auto_increment,
  mail_type varchar(50) DEFAULT NULL,
  sent_as varchar(250) NOT NULL,
  smtp_host varchar(250) DEFAULT NULL,
  smtp_port int DEFAULT NULL,
  smtp_username varchar(250) DEFAULT NULL,
  smtp_password varchar(250) DEFAULT NULL,
  smtp_auth_type varchar(50) DEFAULT NULL,
  smtp_security_type varchar(50) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


CREATE TABLE ohrm_data_group (
    id int AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE,
    description VARCHAR(255),
    can_read TINYINT, can_create TINYINT,
    can_update TINYINT,
    can_delete TINYINT,
    PRIMARY KEY(id)
) ENGINE = INNODB DEFAULT CHARSET=utf8;

CREATE TABLE ohrm_user_role_data_group (
    id int AUTO_INCREMENT,
    user_role_id int,
    data_group_id int,
    can_read TINYINT,
    can_create TINYINT,
    can_update TINYINT,
    can_delete TINYINT,
    self TINYINT,
    PRIMARY KEY(id)
) ENGINE = INNODB DEFAULT CHARSET=utf8;

CREATE TABLE ohrm_leave_type (
  id int unsigned not null auto_increment,
  name varchar(50) not null,
  deleted tinyint not null default 0,
  exclude_in_reports_if_no_entitlement tinyint not null default 0,
  operational_country_id int unsigned default null,
  primary key  (id)
);

CREATE TABLE ohrm_leave_entitlement_type(
  id int unsigned not null auto_increment,
  name varchar(50) not null,
  is_editable  tinyint not null default 0,
  PRIMARY KEY(id)
)ENGINE = INNODB DEFAULT CHARSET=utf8;

CREATE TABLE ohrm_leave_entitlement (
  id int unsigned not null auto_increment,
  emp_number int not null,
  no_of_days decimal(19,15) not null,
  days_used decimal(8,4) not null default 0,
  leave_type_id int unsigned not null,
  from_date datetime not null,
  to_date datetime,
  credited_date datetime,
  note varchar(255) default null,
  entitlement_type int unsigned not null,
  deleted tinyint not null default 0,
  created_by_id int,
  created_by_name varchar(255),
  PRIMARY KEY(id)
) ENGINE = INNODB DEFAULT CHARSET=utf8;

CREATE TABLE ohrm_leave_adjustment (
  id int unsigned not null auto_increment,
  emp_number int not null,
  no_of_days decimal(19,15) not null,
  leave_type_id int unsigned not null,
  from_date datetime,
  to_date datetime,
  credited_date datetime,
  note varchar(255) default null,
  adjustment_type int unsigned not null default 0,
  deleted tinyint not null default 0,
  created_by_id int,
  created_by_name varchar(255),
  PRIMARY KEY(id)
) ENGINE = INNODB DEFAULT CHARSET=utf8;

-- Do we need the field duplication here (leave_request and leave)?
CREATE TABLE ohrm_leave_request (
  id int unsigned NOT NULL auto_increment,
  leave_type_id int unsigned NOT NULL,
  date_applied date NOT NULL,
  emp_number int NOT NULL,
  comments varchar(256) default NULL,
  PRIMARY KEY  (id)
);

CREATE TABLE ohrm_leave (
  id int NOT NULL  auto_increment,
  date date default NULL,
  length_hours decimal(6,2) unsigned default NULL,
  length_days decimal(6,4) unsigned default NULL,
  status smallint default NULL,
  comments varchar(256) default NULL,
  leave_request_idint unsigned NOT NULL,
  leave_type_id int unsigned NOT NULL,
  emp_number int NOT NULL,
  start_time time default NULL,
  end_time time default NULL,
  duration_type tinyint NOT NULL default 0,
  PRIMARY KEY  (id),
  KEY leave_request_type_emp(leave_request_id,leave_type_id,emp_number),
  KEY request_status (leave_request_id,status)
);

CREATE TABLE ohrm_leave_comment (
  id int NOT NULL  auto_increment,
  leave_id int NOT NULL,
  created datetime default NULL,
  created_by_name varchar(255) NOT NULL,
  created_by_id int,
  created_by_emp_number int default NULL,
  comments varchar(255) default NULL,
  PRIMARY KEY  (id)
);

CREATE TABLE ohrm_leave_request_comment (
  id int NOT NULL  auto_increment,
  leave_request_id int unsigned NOT NULL,
  created datetime default NULL,
  created_by_name varchar(255) NOT NULL,
  created_by_id int,
  created_by_emp_number int default NULL,
  comments varchar(255) default NULL,
  PRIMARY KEY  (id)
);

create TABLE ohrm_leave_leave_entitlement (
    id int NOT NULL   auto_increment,
    leave_id int NOT NULL,
    entitlement_id int unsigned NOT NULL,
    length_days decimal(6,4) unsigned default NULL,
    PRIMARY KEY  (id)
);

create TABLE ohrm_leave_entitlement_adjustment (
    id int NOT NULL   auto_increment,
    adjustment_id int unsigned NOT NULL,
    entitlement_id int unsigned NOT NULL,
    length_days decimal(4,2) unsigned default NULL,
    PRIMARY KEY  (id)
);

CREATE TABLE ohrm_leave_period_history (
  id int NOT NULL auto_increment,
  leave_period_start_month int NOT NULL,
  leave_period_start_day int NOT NULL,
  created_at date NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE ohrm_leave_status (
  id int NOT NULL auto_increment,
  status smallint NOT NULL,
  name varchar(100) NOT NULL,
  PRIMARY KEY (id)
);

create table ohrm_advanced_report (
  id int not null,
  name varchar(100) not null,
  definition longtext not null,
  primary key (id)
);

CREATE TABLE ohrm_employee_subscription (
  id int unsigned not null auto_increment,
  employee_id int not null,
  status smallint NOT NULL,
  created_at date NOT NULL,
  PRIMARY KEY(id)
) ENGINE = INNODB DEFAULT CHARSET=utf8;

create table ohrm_home_page (
    id int not null auto_increment,
    user_role_id int not null,
    action varchar(255),
    enable_class varchar(100) default null,
    priority int not null default 0 COMMENT 'lowest priority 0',
    primary key (id)
);

create table ohrm_module_default_page (
    id int not null auto_increment,
    module_id int not null,
    user_role_id int not null,
    action varchar(255),
    enable_class varchar(100) default null,
    priority int not null default 0 COMMENT 'lowest priority 0',
    primary key (id)
);

CREATE TABLE ohrm_data_group_screen (
    id int AUTO_INCREMENT,
    data_group_id int,
    screen_id int,
    permission int,
    PRIMARY KEY(id)
) ENGINE = INNODB DEFAULT CHARSET=utf8;

CREATE TABLE ohrm_plugin (
    id SERIAL,
    name varchar(100) not null,
    version varchar(32),
    primary key (id),
    key (name)
);
