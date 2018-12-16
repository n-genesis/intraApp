<?php
// Site
$_['site_base']            = '';
$_['site_ssl']             = false;

// Database
$_['db_autostart']     = true;
$_['db_type']          = DB_DRIVER; // mpdo, mssql, mysql, mysqli or postgre
$_['db_hostname']      = DB_HOSTNAME;
$_['db_username']      = DB_USERNAME;
$_['db_password']      = DB_PASSWORD;
$_['db_database']      = DB_DATABASE;
$_['db_port']          = DB_PORT;

//Users
$_['default_user']     = 'Default User';
$_['default_passwrd']  = '54875698562';

//PreviouslyViewed
$_['pre_viewed_num'] = 5;

//Number for pagenation
$_['config_limit'] = 10;

//User Permissions
$_['administrator'] = 5;
$_['moderator']     = 3;
$_['default']       = 1;

// Cache
$_['cache_type']           = 'file'; // apc, file or mem
$_['cache_expire']         = 3600;

// Session
$_['session_autostart']    = true;
$_['session_name']         = 'PHPSESSID';


$_['config_compression']   = 0;

// Error
$_['error_display']        = true;
$_['system_log']            = true;
$_['system_filename']       = 'error.log';

// Reponse
$_['response_header']      = array('Content-Type: text/html; charset=utf-8');
$_['response_compression'] = 0;

// Autoload Configs
$_['config_autoload']      = array();

// Autoload Libraries
$_['library_autoload']     = array();

// Autoload Libraries
$_['model_autoload']       = array();

// Actions [system set controllers for system start]
$_['action_default']       = 'dashboard/dashboard';
$_['action_router']        = 'onstartup/router';
$_['action_error']         = 'error/not_found';
$_['action_pre_action']    = array(
    'onstartup/log',
    'onstartup/login',
    'onstartup/startup'
);
// Action Events
$_['action_event'] = array(
    'profile/log'=>'profile/events/logUser',
    'profile/activity'=>'profile/events/logUserActivity'
);