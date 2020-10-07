<?php
	
	require '../api_conf.php';


	if(isset($_GET['data_0'])){

		$id = $_GET['data_id'];

		if($id == null  || $id == "null"){
			$id = md5($_GET['data_0']);
		}

		$data = $dale->kueri("INSERT INTO `master_patients` 
							  SET patients_id        = '".$id."', 
							  	  patients_name      = '".$_GET['data_0']."', 
							  	  patients_address   = '".$_GET['data_1']."',
							  	  patients_hp        = '".'0'.$_GET['data_2']."', 
							  	  patients_dob       = '".$_GET['data_3']."',
							  	  patients_status    = '".$_GET['data_4']."',
							  	  created_by         = 'NULL', 
							  	  updated_by         = 'NULL' 
							  ON DUPLICATE KEY UPDATE 
							  	  patients_name      = '".$_GET['data_0']."', 
							  	  patients_address   = '".$_GET['data_1']."',
							  	  patients_hp        = '".'0'.$_GET['data_2']."', 
							  	  patients_dob       = '".$_GET['data_3']."',
							  	  patients_status    = '".$_GET['data_4']."',
							  	  created_by         = 'NULL', 
							  	  updated_by         = 'NULL' ");
		echo $data;
	}
	
?>