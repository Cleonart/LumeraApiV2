<?php
	header('Access-Control-Allow-Origin: *');

	require '../api_conf.php';
	require './functions.php';

	$data  = file_get_contents("php://input");

	addTransactionSales($dale, $data);
?>
