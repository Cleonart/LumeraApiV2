<?php
	
	header('Access-Control-Allow-Origin: *');

	require '../api_conf.php';

	$product = json_decode($dale->kueri("SELECT * FROM `master_product` WHERE `product_status` = 1"));
	$service = json_decode($dale->kueri("SELECT * FROM `master_services` WHERE `services_status` = 1"));
	$staff   = json_decode($dale->kueri("SELECT * FROM `master_staff` WHERE `staff_roles` != 'Kasir' AND `staff_roles` != 'Administrator'"));

	$all_data = array();
	$i = 0;

	for($i; $i < sizeof($product); $i++){
		$all_data[$i] = array(
			'item_id'       => $product[$i] -> product_id,
			'item_name'     => $product[$i] -> product_name,
			'item_price'    => $product[$i] -> product_price,
			'item_stock'    => $product[$i] -> product_stock,
			'item_category' => "Produk"
		);
	}

	for($i; $i < sizeof($service); $i++){
		$all_data[$i] = array(
			'item_id'       => $service[$i] -> services_id,
			'item_name'     => $service[$i] -> services_name,
			'item_price'    => $service[$i] -> services_price,
			'item_stock'    => 'NO STOCK',
			'item_category' => 'Layanan ' . $service[$i] -> services_category,
			'item_handler'  => 'NOBODY'
		);
	}

	echo json_encode(array(
		'embed_item'  => $all_data,
		'embed_staff' => $staff
	));

?>