<?php

error_reporting(E_ALL);
ini_set('display_errors',1);

define('WEBROOT', str_replace("Webroot/index.php", "", $_SERVER["SCRIPT_NAME"]));
define('ROOT', str_replace("Webroot/index.php", "", $_SERVER["SCRIPT_FILENAME"]));

require_once ROOT . 'vendor/autoload.php';

use Core\Dispatcher;

$dotenv = Dotenv\Dotenv::create(__DIR__ . "/../");
$dotenv->load();

$dispatch = new Dispatcher();
$dispatch->dispatch();
