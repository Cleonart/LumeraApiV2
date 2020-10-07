<?php
	
	require '../api_conf.php';

	if(isset($_GET['id'])){

		// get product detail
		$product = $dale->kueri("SELECT * FROM `master_services` WHERE `services_id` = '".$_GET['id']."'");

		// get hair stylist or hair washer
		$stafs_sylist = $dale->kueri("SELECT * FROM `master_staff` WHERE `staff_roles` = 'Stylist' AND `staff_status` = 1");
		$stafs_hair   = $dale->kueri("SELECT * FROM `master_staff` WHERE `staff_roles` = 'Hair Washer' AND `staff_status` = 1");

		$product      = json_decode($product);
		$stafs_sylist = json_decode($stafs_sylist);
		$stafs_hair   = json_decode($stafs_hair);

		$data = array($product[0], $stafs_sylist, $stafs_hair);
		echo json_encode($data);
	}

?>