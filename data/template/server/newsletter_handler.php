<?php
	require_once('mailchimp/MailChimp.class.php');
	$apiKey 		= 'your_api_key_here'; // Change your mailchimp API key here
	$listId 		= 'your_list_id_here'; // Change your mailchimp list id here
	$double_optin	= false;
	$send_welcome	= false;
	$email_type		= 'html';
	$email 			= $_POST['email'];
	$MailChimp 		= new MailChimp($apiKey);
	$result 		= $MailChimp->call('lists/subscribe', array(
		                'id'                => $listId,
		                'email'             => array('email'=>$email),
		                'merge_vars'        => array('FNAME'=>'', 'LNAME'=>''),
		                'double_optin'      => $double_optin,
		                'update_existing'   => true,
		                'replace_interests' => false,
		                'send_welcome'      => $send_welcome,
		            ));

	if(!empty($result->status)){ // Error
		echo $result->error;
	}
	else{ // Success
		echo "Got it, you've been added to our newsletter. Thanks for subscribe!";
	}
?>