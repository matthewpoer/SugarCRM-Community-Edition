# Schema migration from 1.0x -> 1.1


alter table accounts
	add `assigned_user_id` varchar(36) default NULL after modified_user_id;
	
	
alter table calls
	add `assigned_user_id` varchar(36) default NULL after date_modified;

alter table cases
	add `assigned_user_id` varchar(36) default NULL after modified_user_id;

alter table contacts
	add `assigned_user_id` varchar(36) default NULL after modified_user_id;

alter table emails
	add `assigned_user_id` varchar(36) default NULL after date_modified;

alter table meetings
	add `assigned_user_id` varchar(36) default NULL after date_modified;

alter table opportunities
	add `assigned_user_id` varchar(36) default NULL after modified_user_id;

alter table tasks
	add `assigned_user_id` varchar(36) default NULL after date_modified;

alter table users
	add `language` varchar(20) default NULL after theme;

