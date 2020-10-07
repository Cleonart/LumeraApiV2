<?php

	require '../api_conf.php';
	
	$data = "";
	
	$json_data = [];

	if(isset($_GET['purchase_id'])){
		$data = $dale->kueri("SELECT *  
							  FROM `purchase` 
							  INNER JOIN `purchase_detail` ON `purchase`.`purchase_id` = `purchase_detail`.`purchase_id` 
							  WHERE 
							  `purchase`.`purchase_id` = '".$_GET['purchase_id']."' AND 
							  `purchase`.`purchase_type` = 'Produk'");
		$data = json_decode($data);

		$i = 0;
		$cart = [];
		for($i; $i < sizeof($data); $i++){
			$cart[$i]['product_id']    = $data[$i] -> purchase_item_id;
			$cart[$i]['product_name']  = $data[$i] -> purchase_item;
			$cart[$i]['product_price'] = (int)$data[$i] -> purchase_price;
			$cart[$i]['product_qty']   = (int)$data[$i] -> purchase_qty;
		}

		$arr = array('purchase_id'     => $data[0] -> purchase_id,
					 'purchase_status' => $data[0] -> purchase_status,
					 'purchase_total'  => $data[0] -> purchase_amount,
					 'purchase_date'   => $data[0] -> purchase_date,
					 'cart' => $cart );
		$json_data = $arr;
	}

	else{
		
		$data = $dale->kueri("SELECT * FROM `purchase` WHERE 
							  `purchase`.`purchase_type` = 'Produk'");
		$data = json_decode($data);

		for($i = 0; $i < sizeof($data); $i++){
			
			$json_data[$i][0]['data']  = $data[$i] -> purchase_id;
			$json_data[$i][0]['type']  = "id";

			$json_data[$i][1]['data']  = $data[$i] -> purchase_id;
			$json_data[$i][1]['type']  = "text";

			// purchase total
			$json_data[$i][2]['data']  = $data[$i] -> purchase_amount;
			$json_data[$i][2]['type']  = "price";
			$json_data[$i][2]['class'] = "";

			// product status
			$json_data[$i][3]['data']  = $data[$i] -> purchase_status;
			$json_data[$i][3]['value'] = $data[$i] -> purchase_status;
			$json_data[$i][3]['type']  = "badge_radio";

			if($data[$i] -> purchase_status == 1){
				$json_data[$i][3]['class'] = "badge badge-success";
				$json_data[$i][3]['value'] = "SELESAI";
			}
			else{
				$json_data[$i][3]['class'] = "badge badge-danger";
				$json_data[$i][3]['value'] = "BELUM CHECKOUT";
			}

			// purchase type
			$json_data[$i][4]['data']  = $data[$i] -> purchase_type;
			$json_data[$i][4]['type']  = "text";
			$json_data[$i][4]['class'] = "";

			// purchase date
			$json_data[$i][5]['data']  = $data[$i] -> purchase_date;
			$json_data[$i][5]['type']  = "date";
			$json_data[$i][5]['class'] = "";

		}
	}

	echo json_encode($json_data);
?>