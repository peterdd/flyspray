<?php
$language=array(
'needcomposer'       => 'You need some required libraries installed by Composer.',
'installcomposer'    => 'Run Composer',
'performupgrade'     => 'Perform Upgrade',
'precautions'        => 'Precautions',
'precautionbackup'   => 'Create a backup of your database and all Flyspray related files before performing the upgrade.',
'preconditionchecks' => 'Precondition checks',
'upgrade'            => 'Upgrade',
'upgradepossible'    => 'Apparently, an upgrade is possible.',
'versioncompare'     => 'Your current version is %s and the version we can upgrade to is %s.',
'writeaccessconf'    => 'In order to upgrade Flyspray correctly it needs to be able to access and write flyspray.conf.php.',
'adminemail'         => 'Admin Email',
'adminusername'      => 'Admin Username',
'adminpassword'      => 'Admin Password',
'slogan'             => 'The bug Killer!',
'progress'           => 'Progress',
'documents'          => 'Docs',
'preinstallcheck'    => 'Pre-installation Check',
'databasesetup'      => 'Database Setup',
'administration'     => 'Administration',
'install'            => 'Install Flyspray',
'libcheck'           => 'PHP and Supported Libraries',
'libchecktext'       => '<p>To make setup possible, you must have a correct PHP version installed and at least one supported database.</p>',
'recsettings'        => 'Recommended Settings',
'recsettingstext'    => '<p>These settings are recommended for PHP in order to ensure full compatibility with Flyspray.</p>
<p>However, Flyspray will still operate if your settings do not quite match the recommended shown here.</p>',
'dirandfileperms'    => 'Directory and File Permissions',
'dirandfilepermstext'=> '<p>In order for Flyspray to function correctly it needs to be able to access or write to certain files or directories. If you see "Unwriteable" you need to change the permissions on the file or directory to allow Flyspray to write to it.</p>',
'proceedtodbsetup'   => 'Proceed to Database Setup',
'proceedtodbsetuptext'=>'<p>All configurations seems to be in place. You may proceed to the Database Setup page.</p>',
'library'            => 'library',
'status'             => 'status',
'database'           => 'database',
'recommended'        => 'recommended',
'actual'             => 'actual',
'yes'                => 'Yes',
'no'                 => 'No',
'explainwhatandwhyheader' => 'Formatting of task descriptions and comments has changed',
'explainwhatandwhycontent' => 'Previously those installations of Flyspray that didn\'t use dokuwiki formatting engine stored data as plain text. '
    . 'We now use HTML as the default and can try to add paragraph and line break tags to already existing data entries, so your data retains it\'s '
    . 'structure. But if your existing data already contains manually added HTML tags something probably goes wrong and you have some corrupted '
    . 'entries in your database that must be manually fixed. If unsure, answer "No", unless you can examine the situation before proceeding. '
    . 'If you are fluent in programming with PHP, see also at the end of setup/upgrade.php, look at what it does and possibly modify according to '
    . 'your needs. ',
);
?>
