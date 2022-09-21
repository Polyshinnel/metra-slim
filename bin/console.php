<?php

use App\Jobs\Parser;
use App\Models\Database;
use Symfony\Component\Console\Application;

require __DIR__.'/../config/config.php';
require __DIR__.'/../vendor/autoload.php';


$db = new Database();

$application = new Application();
$application->add(new Parser());
$application->run();