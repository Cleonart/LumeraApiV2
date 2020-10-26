<?php
	header('Access-Control-Allow-Origin: *');

	require '../api_conf.php';

	$data    = file_get_contents("php://input");
	$request = json_decode($data);

	$purchase_id 	 = $request -> answer;
	echo $purchase_id;
?>
