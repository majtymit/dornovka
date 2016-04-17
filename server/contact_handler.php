<?php
	include("class.validate.php");
	if(!empty($_POST['content'])) {
		$string = $_POST['content'];
		parse_str($string);
		$validate = new Validate;
		if($validate->setType("email")->validateString($contactEmail) &&
			$validate->setType("text")->setMinLength(1)->setMaxLength(255)->validateString($contactSubject) &&
			$validate->setType("text")->setMinLength(2)->setMaxLength(1000)->validateString($contactMessage)
			) {
			// Change your email here
			$receiver = "majtymit@gmail.com";
			// Change email subject
			$mailSubject = "New Contact From Dragonfly";
			// Change site name here
			$siteName ="Dragonfly";
			// Keep this block
			$header  = "MIME-Version: 1.0" . "\r\n";
			$header .= "Content-type: text/html; charset=iso-8859-1" . "\r\n";
			$header .= "From: " . $contactEmail;

			// Change email body message here
			$body	="Hi Admin,\nYou have new contact from ".$siteName;
			$body	.="\nEmail Address: ".$contactEmail;
			$body	.="\nSubject: ".$contactSubject;
			$body	.="\nMessage: ".nl2br($comment);
			try{
				mail($receiver, $mailSubject, $body, $header);
				echo "Thank you for contacting us. An email has been sent to the relevant department and somebody will be in contact with you shortly.";
			} catch (Exception $e) {
				echo 'Caught exception: ',  $e->getMessage(), "\n";
			}
		} else { echo "An error has occurred when trying to send your message. Please try again later."; }

	}
?>