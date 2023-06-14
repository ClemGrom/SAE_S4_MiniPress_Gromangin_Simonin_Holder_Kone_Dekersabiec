<?php
declare(strict_types=1);

use minipress\api\services\Eloquent;

session_start();

require_once __DIR__ . '/../src/vendor/autoload.php';

/* application boostrap */
$app = require_once __DIR__ . '/../src/conf/bootstrap.php';

/* routes loading */
(require_once __DIR__ . '/../src/conf/routes.php')($app);

Eloquent::init(__DIR__ . '/../src/conf/db.conf.ini');

$app->run();