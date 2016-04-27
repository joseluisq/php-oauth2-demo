<?php

use OAuth2\Request;

require './server.php';

if (!$server->verifyResourceRequest(Request::createFromGlobals())) {
  $server->getResponse()->send();
  exit;
}

header('Content-Type: application/json; charset=utf-8');

echo json_encode(array(
  'success' => TRUE,
  'message' => 'Congrats! Access granted to the API!'
));
