<?php


namespace App\Controllers\Helpers;


class MailSender
{
    private $mailer;
    private $typeMail;
    private $mailAddr;

    public function __construct($mailer,$typeMail,$mailAddr)
    {
        $this->mailer = $mailer;
        $this->typeMail = $typeMail;
        $this->mailAddr = $mailAddr;
    }

    public function sendMail()
    {
        
    }
}