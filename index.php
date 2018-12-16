<?php
// Version
define('VERSION', '1.2.0.0');

// Configuration
if (is_file('config.php')) {
	require_once('config.php');
}

// initialize system components 
require_once(DIR_SYSTEM . 'initialize.php');

//Application directory 
$application_config = 'application';

// Application
require_once(DIR_SYSTEM . 'framework.php');