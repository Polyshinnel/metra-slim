<?php


namespace App\Jobs;


use App\Controllers\Parser\IntegrationParser;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

class Parser extends Command
{
    protected function configure()
    {
        $this->setName('parser:Products')
            ->setDescription('Парсер для выгрузки из 1с')
            ->setHelp('Парсер для выгрузки из 1с');
    }

    protected function execute(InputInterface $input, OutputInterface $output) : int
    {
        $parser = new IntegrationParser(__DIR__.'/../../public/exchange/products.xml');
        $parser->serializeXml();
        return Command::SUCCESS;
    }
}