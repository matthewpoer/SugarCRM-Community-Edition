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
  
  



