<?php
	
	require '../api_conf.php';


	if(isset($_GET['data_0'])){

		$id = $_GET['data_id'];

		if($id == null  || $id == "null"){
			$id = md5($_GET['data_0']);
		}

		$data = $dale->kueri("INSERT INTO `master_product` 
							  SET product_id        = '".$id."', 
							  	  product_name      = '".$_GET['data_0']."', 
							  	  product_price     = '".$_GET['data_1']."',
							  	  product_stock     = '".$_GET['data_2']."', 
							  	  product_status    = '".$_GET['data_3']."',
							  	  created_by        = 'NULL', 
							  	  updated_by        = 'NULL' 
							  ON DUPLICATE KEY UPDATE 
							  	  product_name      = '".$_GET['data_0']."', 
							  	  product_price     = '".$_GET['data_1']."', 
							  	  product_status    = '".$_GET['data_3']."',
							  	  created_by      = 'NULL', 
							  	  updated_by      = 'NULL'");
		echo $data;
	}
	
?>