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
  
  









