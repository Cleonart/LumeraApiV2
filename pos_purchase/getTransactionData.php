<?php
	header('Access-Control-Allow-Origin: *');

	require '../api_conf.php';
	require './functions.php';

	echo getAllTransactionSales($dale);
?>