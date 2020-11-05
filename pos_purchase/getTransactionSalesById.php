<?php

	header('Access-Control-Allow-Origin: *');

	require '../api_conf.php';
	require './functions.php';

	if(isset($_GET['id'])){
		echo json_encode(getTransactionSales($dale, $_GET['id']));
	}
	else{
		echo json_encode(getTransactionSales($dale));
	}
?>