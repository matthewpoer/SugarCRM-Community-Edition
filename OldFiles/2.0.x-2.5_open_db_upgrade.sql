-- --------------------------------------------------------

-- 
-- Table structure for table `users_feeds`
-- 

CREATE TABLE `users_feeds` (
  `user_id` char(36) NOT NULL default '',
  `feed_id` char(36) NOT NULL default '',
  `rank` int(11) NOT NULL default '0',
  `deleted` tinyint(1) NOT NULL default '0',
  KEY `idx_user_id` (`user_id`,`feed_id`)
) TYPE=MyISAM;

-- --------------------------------------------------------

-- 
-- Table structure for table `releases`
-- 

CREATE TABLE `releases` (
  `id` varchar(36) NOT NULL default '',
  `deleted` tinyint(1) NOT NULL default '0',
  `date_entered` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_user_id` varchar(36) NOT NULL default '',
  `created_by` varchar(36) default NULL,
  `name` varchar(50) NOT NULL default '',
  `list_order` int(4) default NULL,
  `status` varchar(25) default NULL,
  PRIMARY KEY  (`id`),
  KEY `id` (`id`),
  KEY `idx_releases` (`name`,`deleted`)
) TYPE=MyISAM;

-- --------------------------------------------------------

-- 
-- Table structure for table `iframes`
-- 

CREATE TABLE `iframes` (
  `id` char(36) NOT NULL default '',
  `name` char(255) NOT NULL default '',
  `url` char(255) NOT NULL default '',
  `type` char(255) NOT NULL default '',
  `placement` char(255) NOT NULL default '',
  `status` tinyint(1) NOT NULL default '0',
  `deleted` tinyint(1) NOT NULL default '0',
  `date_entered` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` char(36) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `idx_cont_name` (`name`,`deleted`)
) TYPE=MyISAM;

-- --------------------------------------------------------

-- 
-- Table structure for table `feeds`
-- 

CREATE TABLE `feeds` (
  `id` char(36) NOT NULL default '',
  `deleted` tinyint(1) NOT NULL default '0',
  `date_entered` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_user_id` char(36) NOT NULL default '',
  `assigned_user_id` char(36) default NULL,
  `created_by` char(36) default NULL,
  `title` char(100) default NULL,
  `description` char(100) default NULL,
  `url` char(100) default NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_desc` (`title`,`deleted`)
) TYPE=MyISAM;

-- --------------------------------------------------------

-- 
-- Table structure for table `contacts_bugs`
-- 

CREATE TABLE `contacts_bugs` (
  `id` char(36) NOT NULL default '',
  `contact_id` char(36) default NULL,
  `bug_id` char(36) default NULL,
  `contact_role` char(50) default NULL,
  `deleted` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `idx_con_bug_con` (`contact_id`),
  KEY `idx_con_bug_bug` (`bug_id`)
) TYPE=MyISAM; 

-- --------------------------------------------------------

-- 
-- Table structure for table `cases_bugs`
-- 

CREATE TABLE `cases_bugs` (
  `id` char(36) NOT NULL default '',
  `case_id` char(36) default NULL,
  `bug_id` char(36) default NULL,
  `deleted` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `idx_cas_bug_cas` (`case_id`),
  KEY `idx_cas_bug_bug` (`bug_id`)
) TYPE=MyISAM;

-- --------------------------------------------------------

-- 
-- Table structure for table `bugs`
-- 

CREATE TABLE `bugs` (
  `id` varchar(36) NOT NULL default '',
  `number` int(11) NOT NULL auto_increment,
  `date_entered` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_user_id` varchar(36) NOT NULL default '',
  `assigned_user_id` varchar(36) default NULL,
  `deleted` tinyint(1) NOT NULL default '0',
  `name` varchar(255) default NULL,
  `status` varchar(25) default NULL,
  `priority` varchar(25) default NULL,
  `description` text,
  `created_by` varchar(36) default NULL,
  `resolution` varchar(255) default NULL,
  `release` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `number` (`number`),
  KEY `idx_bug_name` (`name`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_bugs`
--

CREATE TABLE `accounts_bugs` (
  `id` char(36) NOT NULL default '',
  `account_id` char(36) default NULL,
  `bug_id` char(36) default NULL,
  `deleted` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `idx_acc_bug_acc` (`account_id`),
  KEY `idx_acc_bug_bug` (`bug_id`)
) TYPE=MyISAM;

-- --------------------------------------------------------

-- 
-- Table structure for table `custom_fields`
-- 

CREATE TABLE `custom_fields` (
  `bean_id` char(36) NOT NULL default '',
  `set_num` int(11) NOT NULL default '0',
  `field0` char(255) default NULL,
  `field1` char(255) default NULL,
  `field2` char(255) default NULL,
  `field3` char(255) default NULL,
  `field4` char(255) default NULL,
  `field5` char(255) default NULL,
  `field6` char(255) default NULL,
  `field7` char(255) default NULL,
  `field8` char(255) default NULL,
  `field9` char(255) default NULL,
  `deleted` tinyint(1) NOT NULL default '0',
  KEY `idx_beanid_set_num` (`bean_id`,`set_num`)
) TYPE=MyISAM;
-- 
-- 105a122
--

ALTER TABLE `calls`
ADD `date_end` date default NULL AFTER `time_start`;

-- --------------------------------------------------------

--
-- 168a186
--

ALTER TABLE `cases`
ADD `resolution` text AFTER `description`;

-- --------------------------------------------------------

-- --------------------------------------------------------

-- 
-- 399a475
--
ALTER TABLE `import_maps`
ADD `source` varchar(36) NOT NULL default '' AFTER `name`;



-- --------------------------------------------------------

-- 
-- 505a612
-- 

ALTER TABLE `meetings`
ADD `date_end` date default NULL AFTER `time_start`;

-- --------------------------------------------------------

--
-- 586c693
-- changed from: `amount` varchar(25) default NULL
--

ALTER TABLE `opportunities`
MODIFY `amount` double default NULL;

-- --------------------------------------------------------

--
-- fixing the way we store duration minutes
-- (actual minutes, not index)
--

UPDATE `calls`
SET duration_minutes=duration_minutes*15;

UPDATE `meetings`
SET duration_minutes=duration_minutes*15;

-- --------------------------------------------------------

--
-- 24a25
--

ALTER TABLE `accounts`
ADD `created_by` varchar(36) default NULL AFTER `assigned_user_id`;

-- --------------------------------------------------------

--
-- 115a147,148
--

ALTER TABLE `calls`
ADD `modified_user_id` varchar(36) default NULL AFTER `assigned_user_id`;

ALTER TABLE `calls`
ADD `created_by` varchar(36) default NULL AFTER `modified_user_id`;

-- --------------------------------------------------------

--
-- 177a211
--

ALTER TABLE `cases`
ADD `created_by` varchar(36) default NULL AFTER `assigned_user_id`;

-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- 356a392,393
--

ALTER TABLE `emails`
ADD `modified_user_id` varchar(36) default NULL AFTER `assigned_user_id`;

ALTER TABLE `emails`
ADD `created_by` varchar(36) default NULL AFTER `modified_user_id`;

-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- 551a579
--
ALTER TABLE `leads`
ADD `created_by` char(36) default NULL AFTER `assigned_user_id`;

-- --------------------------------------------------------

--
-- 625a655,656
--

ALTER TABLE `meetings`
ADD `modified_user_id` varchar(36) default NULL AFTER `assigned_user_id`;

ALTER TABLE `meetings`
ADD `created_by` varchar(36) default NULL AFTER `modified_user_id`;

-- --------------------------------------------------------

--
-- 684a716,717
--

ALTER TABLE `notes`
ADD `modified_user_id` varchar(36) default NULL AFTER `date_modified`;

ALTER TABLE `notes`
ADD `created_by` varchar(36) default NULL AFTER `modified_user_id`;

-- --------------------------------------------------------
--
-- 708a742
--

ALTER TABLE `opportunities`
ADD `created_by` varchar(36) default NULL AFTER `assigned_user_id`;

-- --------------------------------------------------------


--
-- 1072a1117,1118
--

ALTER TABLE `tasks`
ADD `modified_user_id` varchar(36) default NULL AFTER `assigned_user_id`;

ALTER TABLE `tasks`
ADD `created_by` varchar(36) default NULL AFTER `modified_user_id`;

-- --------------------------------------------------------
-- --------------------------------------------------------

--
-- 1205a1255
--

ALTER TABLE `users`
ADD `created_by` varchar(36) default NULL AFTER `modified_user_id`;

ALTER TABLE `contacts`
ADD `created_by` varchar(36) default NULL AFTER `assigned_user_id`;

ALTER TABLE `tasks`
ADD `date_start_flag` CHAR( 5 ) DEFAULT 'on' AFTER `time_due`;

ALTER TABLE `tasks`
ADD `date_start` DATE DEFAULT NULL AFTER `date_start_flag`;

ALTER TABLE `tasks`
ADD `time_start` TIME DEFAULT NULL AFTER `date_start` ;

ALTER TABLE `contacts`
		
		ADD INDEX `idx_contacts_del_last` ( `deleted` , `last_name` ) ,
	 ADD INDEX `idx_cont_del_reports` ( `deleted` , `reports_to_id` , `last_name` ) ;

         
ALTER TABLE `accounts`
	   ADD INDEX `idx_accnt_id_del` ( `id` , `deleted` );

         
ALTER TABLE `accounts_opportunities`

           ADD INDEX `idx_a_o_opp_acc_del` ( `opportunity_id` , `account_id` , `deleted` ) ;
ALTER TABLE `tasks`

           ADD INDEX `idx_task_con_del` ( `contact_id` , `deleted` ) ,

           ADD INDEX `idx_task_par_del` ( `parent_id` , `parent_type` , `deleted` ) ;



ALTER TABLE `leads`

           ADD `converted` TINYINT( 1 ) DEFAULT '0' not null after `deleted`,
           ADD INDEX `idx_lead_del_stat` ( `last_name` , `status` , `deleted` , `first_name` ) ,
		ADD INDEX `idx_lead_opp_del` ( `opportunity_id` , `deleted` ) ,
        ADD INDEX `idx_leads_acct_del` ( `account_id` , `deleted` ) ;   

update leads

           set converted='1' where `status`='Converted';




ALTER TABLE `meetings`

           ADD INDEX `idx_meet_par_del` ( `parent_id` , `parent_type` , `deleted` ) ;

--
-- data migration: deleting unused rows
--

DELETE FROM `accounts_bugs`
WHERE `deleted`=1;

DELETE FROM `accounts_contacts`
WHERE `deleted`=1;

DELETE FROM `accounts_opportunities`
WHERE `deleted`=1;

DELETE FROM `calls_contacts`
WHERE `deleted`=1;

DELETE FROM `calls_users`
WHERE `deleted`=1;

DELETE FROM `cases_bugs`
WHERE `deleted`=1;

DELETE FROM `contacts_bugs`
WHERE `deleted`=1;

DELETE FROM `contacts_cases`
WHERE `deleted`=1;

DELETE FROM `custom_fields`
WHERE `deleted`=1;

DELETE FROM `emails_accounts`
WHERE `deleted`=1;

DELETE FROM `emails_cases`
WHERE `deleted`=1;

DELETE FROM `emails_contacts`
WHERE `deleted`=1;

DELETE FROM `emails_opportunities`
WHERE `deleted`=1;

DELETE FROM `emails_users`
WHERE `deleted`=1;

DELETE FROM `import_maps`
WHERE `deleted`=1;

DELETE FROM `meetings_contacts`
WHERE `deleted`=1;

DELETE FROM `meetings_users`
WHERE `deleted`=1;

DELETE FROM `opportunities_contacts`
WHERE `deleted`=1;

DELETE FROM `users_feeds`
WHERE `deleted`=1;

DELETE FROM `users_last_import`
WHERE `deleted`=1;           


INSERT INTO config (category, name, value) VALUES ('MySettings', 'tab', '');
INSERT INTO config (category, name, value) VALUES ('info', 'sugar_version', '2.5');
