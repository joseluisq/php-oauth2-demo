<?php

use OAuth2\Autoloader;
use OAuth2\Server;
use OAuth2\GrantType\ClientCredentials;
use OAuth2\GrantType\AuthorizationCode;
use OAuth2\Storage\Pdo;

require './vendor/autoload.php';

date_default_timezone_set('America/Lima');

$dsn = 'mysql:dbname=dbaouth;host=localhost';
$username = 'root';
$password = 'root';

ini_set('display_errors', 1);
error_reporting(E_ALL);

Autoloader::register();

$storage = new Pdo(array(
  'dsn' => $dsn,
  'username' => $username,
  'password' => $password
  ));

$server = new Server($storage);
$server->addGrantType(new ClientCredentials($storage));
$server->addGrantType(new AuthorizationCode($storage));
