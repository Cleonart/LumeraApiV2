<?php
	
	require './functions.php';

	$start_date = $_GET['start_date'];
	$end_date   = $_GET['end_date'];

	$pendapatan = json_encode(getSelling($dale, $start_date, $end_date));
	echo $pendapatan;
?>