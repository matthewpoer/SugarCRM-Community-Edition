# Schema migration from 0.8 -> 0.8b

CREATE TABLE `accounts_cases` (
  `id` char(50) NOT NULL default '',
  `case_id` char(50) default NULL,
  `account_id` char(50) default NULL,
  `deleted` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `idx_acc_case_acc` (`account_id`),
  KEY `idx_acc_case_opp` (`case_id`)
) TYPE=MyISAM;

CREATE TABLE `calls` (
  `id` char(50) NOT NULL default '',
  `date_entered` timestamp(14) NOT NULL,
  `date_modified` timestamp(14) NOT NULL default '00000000000000',
  `name` char(50) default NULL,
  `duration_hours` char(2) default NULL,
  `duration_minutes` char(2) default NULL,
  `date_start` date default NULL,
  `time_start` time default NULL,
  `parent_type` char(25) default NULL,
  `parent_id` char(50) default NULL,
  `description` char(255) default NULL,
  `deleted` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `idx_call_name` (`name`)
) TYPE=MyISAM;

CREATE TABLE `calls_contacts` (
  `id` char(50) NOT NULL default '',
  `call_id` char(50) default NULL,
  `contact_id` char(50) default NULL,
  `deleted` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `idx_con_call_call` (`call_id`),
  KEY `idx_con_call_con` (`contact_id`)
) TYPE=MyISAM;

CREATE TABLE `calls_users` (
  `id` char(50) NOT NULL default '',
  `call_id` char(50) default NULL,
  `user_id` char(50) default NULL,
  `deleted` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `idx_usr_call_call` (`call_id`),
  KEY `idx_usr_call_usr` (`user_id`)
) TYPE=MyISAM;


CREATE TABLE `cases` (
  `id` char(50) NOT NULL default '',
  `number` int(11) NOT NULL auto_increment,
  `date_entered` timestamp(14) NOT NULL,
  `date_modified` timestamp(14) NOT NULL default '00000000000000',
  `modified_user_id` char(50) NOT NULL default '',
  `deleted` tinyint(1) NOT NULL default '0',
  `name` char(100) default NULL,
  `status` char(25) default NULL,
  `description` char(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `number` (`number`),
  KEY `idx_case_name` (`name`)
) TYPE=MyISAM AUTO_INCREMENT=1;


CREATE TABLE `contacts_cases` (
  `id` char(50) NOT NULL default '',
  `contact_id` char(50) default NULL,
  `case_id` char(50) default NULL,
  `contact_role` char(50) default NULL,
  `deleted` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `idx_con_case_con` (`contact_id`),
  KEY `idx_con_case_case` (`case_id`)
) TYPE=MyISAM;

CREATE TABLE `emails` (
  `id` char(50) NOT NULL default '',
  `date_entered` timestamp(14) NOT NULL,
  `date_modified` timestamp(14) NOT NULL default '00000000000000',
  `name` char(50) default NULL,
  `date_start` date default NULL,
  `time_start` time default NULL,
  `parent_type` char(25) default NULL,
  `parent_id` char(50) default NULL,
  `description` char(255) default NULL,
  `deleted` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `idx_email_name` (`name`)
) TYPE=MyISAM;

CREATE TABLE `emails_contacts` (
  `id` char(50) NOT NULL default '',
  `email_id` char(50) default NULL,
  `contact_id` char(50) default NULL,
  `deleted` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `idx_con_email_email` (`email_id`),
  KEY `idx_con_email_con` (`contact_id`)
) TYPE=MyISAM;

CREATE TABLE `emails_users` (
  `id` char(50) NOT NULL default '',
  `email_id` char(50) default NULL,
  `user_id` char(50) default NULL,
  `deleted` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `idx_usr_email_email` (`email_id`),
  KEY `idx_usr_email_usr` (`user_id`)
) TYPE=MyISAM;


alter TABLE `opportunities_contacts`
add  KEY `idx_con_opp_con` (`contact_id`),
add  KEY `idx_con_opp_opp` (`opportunity_id`);













# Schema migration from 0.8b -> 0.8d

drop table accounts_cases;

alter table calls add `status` char(25) default NULL after parent_type;

alter table cases
add `account_name` char(100) default NULL after name,
add `account_id` char(50) default NULL after account_name;

alter table meetings
add `status` char(25) default NULL after parent_type;


# Schema migration from 0.8d -> 1.0

alter table `accounts`
  modify `date_entered` datetime NOT NULL default '0000-00-00 00:00:00',
  modify `date_modified` datetime NOT NULL default '0000-00-00 00:00:00';
  
alter table `calls`
  modify `id` char(50) NOT NULL default '',
  modify `date_entered` datetime NOT NULL default '0000-00-00 00:00:00',
  modify `date_modified` datetime NOT NULL default '0000-00-00 00:00:00';
  
  
  alter table `cases`
    modify `id` char(50) NOT NULL default '',
    modify `number` int(11) NOT NULL auto_increment,
    modify `date_entered` datetime NOT NULL default '0000-00-00 00:00:00',
  modify `date_modified` datetime NOT NULL default '0000-00-00 00:00:00';
  
  
  alter table `contacts`
    modify `date_entered` datetime NOT NULL default '0000-00-00 00:00:00',
    modify `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
    modify `do_not_call` char(3) default '0',
    modify `email_opt_out` char(3) default '0';

alter table `emails`
  modify `date_entered` datetime NOT NULL default '0000-00-00 00:00:00',
  modify `date_modified` datetime NOT NULL default '0000-00-00 00:00:00';
  
  
alter table `meetings`
  modify `date_entered` datetime NOT NULL default '0000-00-00 00:00:00',
  modify `date_modified` datetime NOT NULL default '0000-00-00 00:00:00';
  
alter table `opportunities`
  modify `date_entered` datetime NOT NULL default '0000-00-00 00:00:00',
  modify `date_modified` datetime NOT NULL default '0000-00-00 00:00:00';
  
alter table `tasks`
  modify `date_entered` datetime NOT NULL default '0000-00-00 00:00:00',
  modify `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  modify `date_due_flag` char(5) default 'on';  

alter table `users`
  modify `user_password` varchar(30) default NULL,
add `reports_to_id` varchar(50) default NULL after last_name,
add `is_admin` char(3) default '0' after reports_to_id,
change notes `description` text,
  modify `date_entered` datetime NOT NULL default '0000-00-00 00:00:00',
  modify `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
add  `phone_other` varchar(50) default NULL after phone_work,
add  `phone_fax` varchar(50) default NULL after phone_other,
change email `email1` varchar(100) default NULL,
add  `email2` varchar(100) default NULL after email1,
add  `yahoo_id` varchar(100) default NULL after email2,
add  `status` varchar(25) default NULL after yahoo_id,
change address_street1 `address_street` varchar(150) default NULL,
drop address_street2,
add  `address_country` varchar(25) default NULL after address_state,
change address_zipcode `address_postalcode` varchar(9) default NULL;

# Schema migration from 0.9 -> 1.0

alter table accounts modify `id` varchar(36) NOT NULL default '';
alter table accounts modify `modified_user_id` varchar(36) NOT NULL default '';
alter table accounts modify `parent_id` varchar(36) default NULL;

alter TABLE accounts_contacts modify `id` char(36) NOT NULL default '',
  modify `contact_id` char(36) default NULL,
  modify `account_id` char(36) default NULL;
  
alter TABLE accounts_opportunities modify `id` char(36) NOT NULL default '',
  modify `opportunity_id` char(36) default NULL,
  modify `account_id` char(36) default NULL;

alter TABLE calls modify `id` char(36) NOT NULL default '',
  modify `parent_id` char(36) default NULL;
  
  
alter table calls_contacts modify `id` char(36) NOT NULL default '',
  modify `call_id` char(36) default NULL,
  modify `contact_id` char(36) default NULL;


alter table calls_users modify `id` char(36) NOT NULL default '',
  modify `call_id` char(36) default NULL,
  modify `user_id` char(36) default NULL;

alter table cases modify `id` varchar(36) NOT NULL default '',
modify `modified_user_id` varchar(36) NOT NULL default '',
modify `name` varchar(255) default NULL,
modify `account_name` varchar(100) default NULL,
modify `account_id` varchar(36) default NULL,
modify `status` varchar(25) default NULL,
modify `description` text;

alter TABLE contacts modify `id` varchar(36) NOT NULL default '',
  modify `modified_user_id` varchar(36) NOT NULL default '',
  change reports_to `reports_to_id` varchar(36) default NULL;

alter TABLE `contacts_cases` 
modify `id` char(36) NOT NULL default '',
modify `contact_id` char(36) default NULL,
modify `case_id` char(36) default NULL;

alter TABLE `emails` 
modify  `id` varchar(36) NOT NULL default '',
modify  `name` varchar(255) default NULL,
modify  `parent_type` varchar(25) default NULL,
modify  `parent_id` varchar(36) default NULL,
modify  `description` text;

alter TABLE `emails_contacts` 
modify  `id` char(36) NOT NULL default '',
modify  `email_id` char(36) default NULL,
modify  `contact_id` char(36) default NULL;

alter TABLE `emails_users` 
modify  `id` char(36) NOT NULL default '',
modify  `email_id` char(36) default NULL,
modify  `user_id` char(36) default NULL;

alter TABLE `meetings` 
modify  `id` char(36) NOT NULL default '',
modify  `parent_id` char(36) default NULL;


alter TABLE `meetings_contacts` 
modify  `id` char(36) NOT NULL default '',
modify  `meeting_id` char(36) default NULL,
modify  `contact_id` char(36) default NULL;

alter TABLE `meetings_users`
modify id char(36) NOT NULL default '', 
modify meeting_id char(36) default NULL, 
modify user_id char(36) default NULL; 
  
CREATE TABLE `notes` (
  `id` varchar(36) NOT NULL default '',
  `date_entered` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `name` varchar(255) default NULL,
  `parent_type` varchar(25) default NULL,
  `parent_id` varchar(36) default NULL,
  `contact_id` varchar(36) default NULL,
  `description` text,
  `deleted` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `idx_note_name` (`name`)
) TYPE=MyISAM;  

alter table `opportunities`
modify `id` char(36) NOT NULL default '',
modify `modified_user_id` char(36) NOT NULL default '';
  
alter table `opportunities_contacts`
modify `id` char(36) NOT NULL default '',
modify `contact_id` char(36) default NULL,
modify `opportunity_id` char(36) default NULL;
  
alter table `tasks`
modify `id` char(36) NOT NULL default '',
modify `parent_id` char(36) default NULL,
modify `contact_id` char(36) default NULL;  

alter table `tracker`
modify `user_id` char(36) default NULL,
modify `item_id` char(36) default NULL;

alter table `users`
modify `id` varchar(36) NOT NULL default '',
modify `reports_to_id` varchar(36) default NULL,
modify `modified_user_id` varchar(36) NOT NULL default '';
  
  









