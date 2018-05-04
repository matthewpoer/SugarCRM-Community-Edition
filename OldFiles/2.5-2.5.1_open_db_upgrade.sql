-- $Id: 2.5-2.5.1_open_db_upgrade.sql,v 1.3 2005/04/07 22:56:48 bob Exp $

ALTER TABLE bugs ADD `fixed_in_release` varchar(255) DEFAULT NULL AFTER `type`;
ALTER TABLE bugs ADD `work_log` text AFTER `fixed_in_release`;
ALTER TABLE bugs ADD `source` varchar(255) default NULL AFTER `work_log`;
ALTER TABLE bugs ADD `product_category` varchar(255) default NULL AFTER `source`;

ALTER TABLE contacts ADD `portal_name` varchar(255) default NULL AFTER `description`;
ALTER TABLE contacts ADD `portal_active` tinyint(1) NOT NULL default '0' AFTER `portal_name`;
ALTER TABLE contacts ADD `portal_app` varchar(255) default NULL AFTER `portal_active`;

ALTER TABLE emails ADD `from_addr` varchar(100) default NULL AFTER `description`;
ALTER TABLE emails ADD `from_name` varchar(100) default NULL AFTER `from_addr`;
ALTER TABLE emails ADD `to_addrs` text AFTER `from_name`;
ALTER TABLE emails ADD `cc_addrs` text AFTER `to_addrs`;
ALTER TABLE emails ADD `bcc_addrs` text AFTER `cc_addrs`;
ALTER TABLE emails ADD `to_addrs_ids` text AFTER `bcc_addrs`;
ALTER TABLE emails ADD `to_addrs_names` text AFTER `to_addrs_ids`;
ALTER TABLE emails ADD `to_addrs_emails` text AFTER `to_addrs_names`;
ALTER TABLE emails ADD `cc_addrs_ids` text AFTER `to_addrs_emails`;
ALTER TABLE emails ADD `cc_addrs_names` text AFTER `cc_addrs_ids`;
ALTER TABLE emails ADD `cc_addrs_emails` text AFTER `cc_addrs_names`;
ALTER TABLE emails ADD `bcc_addrs_ids` text AFTER `cc_addrs_emails`;
ALTER TABLE emails ADD `bcc_addrs_names` text AFTER `bcc_addrs_ids`;
ALTER TABLE emails ADD `bcc_addrs_emails` text AFTER `bcc_addrs_names`;
ALTER TABLE emails ADD `type` varchar(25) default NULL AFTER `bcc_addrs_emails`;
ALTER TABLE emails ADD `status` varchar(25) default NULL AFTER `type`;

ALTER TABLE leads ADD `portal_name` varchar(255) default NULL AFTER `opportunity_amount`;
ALTER TABLE leads ADD `portal_app` varchar(255) default NULL AFTER `portal_name`;

ALTER TABLE notes ADD `portal_flag` tinyint(1) NOT NULL default '0' AFTER `contact_id`;
ALTER TABLE notes ADD `file_mime_type` char(100) AFTER `filename`;

ALTER TABLE users ADD `portal_only` tinyint(1) NOT NULL default '0' AFTER `deleted`;

CREATE TABLE `versions` (
  `id` char(36) NOT NULL default '',
  `deleted` tinyint(1) NOT NULL default '0',
  `date_entered` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_user_id` char(36) NOT NULL default '',
  `created_by` char(36) default NULL,
  `name` char(255) NOT NULL default '',
  `file_version` char(255) NOT NULL default '',
  `db_version` char(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `id` (`id`),
  KEY `idx_version` (`name`,`deleted`)
) TYPE=MyISAM;

UPDATE `emails` SET `type`='archived' WHERE `type` IS NULL;

DELETE FROM `config` WHERE `category`='info' AND `name`='sugar_version';
INSERT INTO `config` (category, name, value) VALUES ('info', 'sugar_version', '2.5.1');
INSERT INTO `config` (category, name, value) VALUES ('portal', 'on', '0');
