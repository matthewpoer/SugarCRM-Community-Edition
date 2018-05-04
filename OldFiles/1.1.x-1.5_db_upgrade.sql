# The contents of this file are subject to the SugarCRM Public License Version 1.1.2
# ("License"); You may not use this file except in compliance with the# License. You may obtain a copy of the License at http://www.sugarcrm.com/SPL
# Software distributed under the License is distributed on an  "AS IS"  basis,
# WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
# the specific language governing rights and limitations under the License.
# The Original Code is:  SugarCRM Open Source# The Initial Developer of the Original Code is SugarCRM, Inc.
# Portions created by SugarCRM are Copyright (C) SugarCRM, Inc.;
# All Rights Reserved.
# Contributor(s): ____________________________________

# Description:  Schema migration from 1.1x -> 1.5


# This SQL script must be run on a Sugar Sales 1.1 database in order for that db
# to function with the 1.5 application.

UPDATE calls SET parent_type = 'Accounts' WHERE parent_type = 'Account';

UPDATE calls SET parent_type = 'Opportunities' WHERE parent_type = 'Opportunity';

UPDATE calls SET parent_type = 'Cases' WHERE parent_type = 'Case';


UPDATE emails SET parent_type = 'Accounts' WHERE parent_type = 'Account';

UPDATE emails SET parent_type = 'Opportunities' WHERE parent_type = 'Opportunity';

UPDATE emails SET parent_type = 'Cases' WHERE parent_type = 'Case';


UPDATE meetings SET parent_type = 'Accounts' WHERE parent_type = 'Account';

UPDATE meetings SET parent_type = 'Opportunities' WHERE parent_type = 'Opportunity';

UPDATE meetings SET parent_type = 'Cases' WHERE parent_type = 'Case';


UPDATE notes SET parent_type = 'Accounts' WHERE parent_type = 'Account';

UPDATE notes SET parent_type = 'Opportunities' WHERE parent_type = 'Opportunity';

UPDATE notes SET parent_type = 'Cases' WHERE parent_type = 'Case';


UPDATE tasks SET parent_type = 'Accounts' WHERE parent_type = 'Account';

UPDATE tasks SET parent_type = 'Opportunities' WHERE parent_type = 'Opportunity';

UPDATE tasks SET parent_type = 'Cases' WHERE parent_type = 'Case';


ALTER TABLE notes ADD filename VARCHAR(255) AFTER description;


ALTER TABLE users DROP theme;
ALTER TABLE users DROP language;

ALTER TABLE users ADD user_preferences TEXT AFTER address_postalcode;


UPDATE users SET status = 'Active' WHERE status != 'Inactive' OR status IS NULL;


ALTER TABLE users ADD user_hash CHAR(32) DEFAULT NULL AFTER user_password;


ALTER TABLE contacts CHANGE title title VARCHAR(40) DEFAULT NULL;