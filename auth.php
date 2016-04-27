<?php

use OAuth2\Request;

require './server.php';

$server->handleTokenRequest(Request::createFromGlobals())->send();
