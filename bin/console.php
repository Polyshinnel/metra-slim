<?php

use App\Jobs\Parser;
use Symfony\Component\Console\Application;

require __DIR__.'/../vendor/autoload.php';

$application = new Application();
$application->add(new Parser());
$application->run();