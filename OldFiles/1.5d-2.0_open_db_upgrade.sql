ALTER TABLE calls ADD direction varchar(25) default NULL AFTER status;
Update calls set direction='Outbound' where direction is NULL;
ALTER TABLE cases ADD priority varchar(25) default NULL AFTER status;
Update cases set priority='P2' where priority IS NULL;
ALTER TABLE contacts DROP cOlumn yahoo_id;
ALTER TABLE opportunities ADD amount_backup varchar(25) default NULL AFTER amount;
ALTER TABLE opportunities ADD amount_usdollar double default NULL AFTER amount_backup;
ALTER TABLE opportunities ADD currency_id varchar(36) default NULL AFTER amount_usdollar;
ALTER TABLE users ADD receive_notifications char(1) default '1' AFTER is_admin;
ALTER TABLE users DROP COlumn yahoo_id;
CREATE TABLE `config` (
  `category` varchar(32) NOT NULL default '',
  `name` varchar(32) NOT NULL default '',
  `value` text NOT NULL
) TYPE=MyISAM;
CREATE TABLE `currencies` (
  `id` char(36) NOT NULL default '',
  `name` char(36) NOT NULL default '',
  `symbol` char(36) NOT NULL default '',
  `iso4217` char(3) NOT NULL default '',
  `conversion_rate` double NOT NULL default '0',
  `status` char(25) default NULL,
  `deleted` tinyint(1) NOT NULL default '0',
  `date_entered` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  KEY `idx_cont_name` (`name`,`deleted`)
) TYPE=MyISAM;
CREATE TABLE `leads` (
  `id` varchar(36) NOT NULL default '',
  `deleted` tinyint(1) NOT NULL default '0',
  `date_entered` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_user_id` varchar(36) NOT NULL default '',
  `assigned_user_id` varchar(36) default NULL,
  `salutation` varchar(5) default NULL,
  `first_name` varchar(25) default NULL,
  `last_name` varchar(25) default NULL,
  `title` varchar(100) default NULL,
  `refered_by` varchar(100) default NULL,
  `lead_source` varchar(100) default NULL,
  `lead_source_description` text,
  `status` varchar(100) default NULL,
  `status_description` text,
  `department` varchar(100) default NULL,
  `reports_to_id` varchar(36) default NULL,
  `do_not_call` char(3) default '0',
  `phone_home` varchar(25) default NULL,
  `phone_mobile` varchar(25) default NULL,
  `phone_work` varchar(25) default NULL,
  `phone_other` varchar(25) default NULL,
  `phone_fax` varchar(25) default NULL,
  `email1` varchar(100) default NULL,
  `email2` varchar(100) default NULL,
  `email_opt_out` char(3) default '0',
  `primary_address_street` varchar(150) default NULL,
  `primary_address_city` varchar(100) default NULL,
  `primary_address_state` varchar(100) default NULL,
  `primary_address_postalcode` varchar(20) default NULL,
  `primary_address_country` varchar(100) default NULL,
  `alt_address_street` varchar(150) default NULL,
  `alt_address_city` varchar(100) default NULL,
  `alt_address_state` varchar(100) default NULL,
  `alt_address_postalcode` varchar(20) default NULL,
  `alt_address_country` varchar(100) default NULL,
  `description` text,
  `account_name` varchar(150) default NULL,
  `account_description` text,
  `contact_id` varchar(36) default NULL,
  `account_id` varchar(36) default NULL,
  `opportunity_id` varchar(36) default NULL,
  `opportunity_name` varchar(255) default NULL,
  `opportunity_amount` varchar(50) default NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_lead_last_first` (`last_name`,`first_name`,`deleted`)
) TYPE=MyISAM;
