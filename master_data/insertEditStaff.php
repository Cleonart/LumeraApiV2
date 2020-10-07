<?php
	
	require '../api_conf.php';


	if(isset($_GET['data_0'])){

		$id = $_GET['data_id'];

		if($id == null  || $id == "null"){
			$id = md5($_GET['data_0']);
		}

		$data = $dale->kueri("INSERT INTO `master_staff` 
							  SET staff_id        = '".$id."', 
							  	  staff_name      = '".$_GET['data_0']."', 
							  	  staff_username  = '".$_GET['data_1']."',
							  	  staff_password  = '".$_GET['data_2']."', 
							  	  staff_roles     = '".$_GET['data_3']."',
							  	  staff_status    = '".$_GET['data_4']."',
							  	  created_by      = 'NULL', 
							  	  updated_by      = 'NULL' 
							  ON DUPLICATE KEY UPDATE 
							  	  staff_name      = '".$_GET['data_0']."', 
							  	  staff_username  = '".$_GET['data_1']."',
							  	  staff_password  = '".$_GET['data_2']."', 
							  	  staff_roles     = '".$_GET['data_3']."',
							  	  staff_status    = '".$_GET['data_4']."',
							  	  created_by      = 'NULL', 
							  	  updated_by      = 'NULL'");
		echo $data;
	}
	
?>