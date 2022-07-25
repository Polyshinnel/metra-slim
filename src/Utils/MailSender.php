<?php


namespace App\Utils;


use PHPMailer\PHPMailer\PHPMailer;

class MailSender
{
    private $mailAddr;
    private $mail;

    public function __construct($mailAddr,$mail)
    {
        $this->mailAddr = $mailAddr;
        $this->mail = $mail;
    }

    public function sendMail()
    {
        $mailClass = new PHPMailer(true);
        $mailClass->CharSet = 'UTF-8';

        $mail = $this->mail;
        $mailAddr = $this->mailAddr;

        $subject = $mail['subject'];
        $text = $mail['text'];


        try {
            $mailClass->isSMTP();
            $mailClass->Host       = hostname;
            $mailClass->SMTPAuth   = true;
            $mailClass->SMTPAutoTLS = false;
            $mailClass->Username   = mailName;
            $mailClass->Password   = mailPass;
            $mailClass->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;           //Enable implicit TLS encryption
            $mailClass->Port       = 587;                                     //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

            $mailClass->SMTPOptions = array(
                'ssl' => array(
                    'verify_peer' => false,
                    'verify_peer_name' => false,
                    'allow_self_signed' => true
                )
            );

            //Recipients
            $mailClass->setFrom(mailName, notifyName);
            $mailClass->addAddress($mailAddr);     //Add a recipient

            $sign = '<br><br><br><br>--<br><img src="'.signLogo.'"><br><p style="margin:0;font-size:14px;">С уважением</p><p style="margin:0;font-size:14px;">'.signText.'</p><p style="margin:0;font-size:14px;">'.signPhone.'</p><p style="margin:0;font-size:14px;">'.signMail.'</p>';

            $text .= $sign;

            //Content
            $mailClass->isHTML(true);                                  //Set email format to HTML
            $mailClass->Subject = $subject;
            $mailClass->Body    = $text;

            $mailClass->send();
            return 'Письмо отравлено!';
        } catch (Exception $e) {
            return "Message could not be sent. Mailer Error: {$mailClass->ErrorInfo}";
        }
    }
}