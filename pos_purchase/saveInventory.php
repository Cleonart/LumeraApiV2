<?php

	header('Access-Control-Allow-Origin: *');

	require '../api_conf.php';

	$data    = file_get_contents("php://input");
	$request = json_decode($data);
	
	$purchase_id 	 = $request -> purchase_id; 
	$purchase_date   = $dale->tanggalHariIni();    // ini tanggal invoice pembelian
	$purchase_amount = $request -> purchase_total;
	$purchase_status = $request -> purchase_status;
	$purchase_items  = $request -> purchase_items;
	$purchase_type   = "Inventaris";

	$data = $dale->kueri("INSERT INTO `purchase` 
							  SET purchase_id        = '".$purchase_id."', 
							  	  purchase_date      = '".$purchase_date."', 
							  	  purchase_amount    = '".$purchase_amount."',
							  	  purchase_type      = '".$purchase_type."', 
							  	  purchase_status    = '".$purchase_status."',
							  	  purchase_served_by = '',
							  	  created_by         = 'NULL', 
							  	  updated_by         = 'NULL' 
							  ON DUPLICATE KEY UPDATE 
							  	  purchase_date      = '".$purchase_date."', 
							  	  purchase_amount    = '".$purchase_amount."',
							  	  purchase_type      = '".$purchase_type."', 
							  	  purchase_status    = '".$purchase_status."',
							  	  purchase_served_by = '',
							  	  created_by         = 'NULL', 
							  	  updated_by         = 'NULL' ");

	// delete previous version
	$dale->kueri("DELETE FROM `purchase_detail` WHERE `purchase_id` = '".$purchase_id."'");

	// registering item in product
	$i = 0;
	for($i; $i < sizeof($purchase_items); $i++){

		$item_id    = $purchase_items[$i] -> product_id;
		$item_name  = $purchase_items[$i] -> product_name;
		$item_price = $purchase_items[$i] -> product_price;
		$item_qty   = $purchase_items[$i] -> product_qty;

		$data = $dale->kueri("INSERT INTO `purchase_detail` 
							(`purchase_detail_id`,
							 `purchase_id`, 
							 `purchase_item_id`, 
							 `purchase_item`, 
							 `purchase_qty`, 
							 `purchase_price`, 
							 `purchase_total`) 
							 VALUES 
							('',
							 '".$purchase_id."', 
							 '".$item_id."', 
							 '".$item_name."', 
							 '".$item_qty."', 
							 '".$item_price."',
							 '".$item_price * $item_qty."')");

		// updating product stock
		// only update stock if status = 1 | checkout
		if($purchase_status == 1){

			// get the curent stock
			$data = $dale->kueri("SELECT `product_stock` 
								  FROM   `master_product` 
								  WHERE  `product_id` = '".$item_id."'");

			// add the last stock position with new stock
			$item_stok_now = json_decode($data);
			$item_stok_now = $item_stok_now[0] -> product_stock;
			$update_stok   = (int)$item_stok_now + $item_qty;

			// set update stok
			$data = $dale->kueri("UPDATE `master_product` 
								  SET    `product_stock` = '".$update_stok."' 
								  WHERE  `master_product`.`product_id` = '".$item_id."'");
		}
	}



	echo json_decode($request);

?>