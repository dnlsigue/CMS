<?php
require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

$mail = new PHPMailer();

try {
    // $mail->SMTPSecure='ssl';
    //Server settings
    $mail->SMTPDebug = 2;   // Enable verbose debug output
    $mail->isSMTP(); // Set mailer to use SMTP
    $mail->Host = 'mail.ucc-csd-bscs.com'; // Specify main and backup SMTP servers
    $mail->SMTPAuth = true; // Enable SMTP authentication
    $mail->Username = 'cms-support-cs@ucc-csd-bscs.com'; // SMTP username
    $mail->Password = '$Gabriel03'; // SMTP password
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;  // Enable TLS encryption, [ICODE]ssl[/ICODE] also accepted
    $mail->Port = 465; // TCP port to connect to
    $mail->setFrom('cms-support-cs@ucc-csd-bscs.com');
} catch (Exception $e) {
    $mail->ErrorInfo;
}
//Function to call which uses the PHP imap_*() functions to save messages
function save_mail($mail)
{
    //You can change 'Sent Mail' to any other folder or tag
    //Use imap_getmailboxes($imapStream, '/imap/ssl') to retrieve a list of available folders or tags
    $path = "{mail.ucc-csd-bscs.com:993/imap/ssl/novalidate-cert}INBOX.Sent"; //ADD INBOX.sent
    //Tell your server to open an IMAP connection using the same username and password as you used for SMTP
    $imapStream = imap_open($path, $mail->Username, $mail->Password);
    $result = imap_append($imapStream, $path, $mail->getSentMIMEMessage());
    imap_close($imapStream);
    return $result;

}


// $mail->addAddress('andrielgeomergabriel07@gmail.com'); // Add a recipient
// $mail->addReplyTo('');
// $mail->addCC('');
// $mail->addBCC('');


// //Attachments
// $mail->addAttachment('');//Add attachments


// $mail->isHTML(true);
// $mail->Subject = '';
// $mail->Body = '';
// $mail->AltBody = '';
// $mail->send();