<?php

use OAuth2\Request;
use OAuth2\Response;

require './server.php';

$request = Request::createFromGlobals();
$response = new Response();

// Validate the authorize request
if (!$server->validateAuthorizeRequest($request, $response)) {
  $response->send();
  exit;
}
// display an authorization form
if (empty($_POST)) {
  exit('
    <form method="post">
      <label>Do You Authorize TestClient?</label><br />
      <input type="submit" name="authorized" value="yes">
      <input type="submit" name="authorized" value="no">
    </form>
  ');
}

// print the authorization code if the user has authorized your client
$is_authorized = ($_POST['authorized'] === 'yes');
$server->handleAuthorizeRequest($request, $response, $is_authorized);

if ($is_authorized) {
  // this is only here so that you get to see your code in the cURL request. Otherwise, we'd redirect back to the client
  $code = substr($response->getHttpHeader('Location'), strpos($response->getHttpHeader('Location'), 'code=') + 5, 40);
  exit("SUCCESS! Authorization Code: $code");
} else {;
  exit("ERROR! Access denied");
}

$response->send();
