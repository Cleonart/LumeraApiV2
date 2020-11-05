<?php

	header('Access-Control-Allow-Origin: *');

	function getAllTransactionSales($dale){
		$data = json_decode($dale -> kueri("SELECT * FROM `transaction`"));
		$json_data = [];

		for($i = 0; $i < sizeof($data); $i++){
			
			$json_data[$i][0]['data']  = $data[$i] -> transaction_id;
			$json_data[$i][0]['type']  = "id";

			$json_data[$i][1]['data']  = $data[$i] -> transaction_name;
			$json_data[$i][1]['type']  = "text";

			$json_data[$i][2]['data']  = $data[$i] -> transaction_created_date;
			$json_data[$i][2]['type']  = "date";
			
			$json_data[$i][3]['data']  = $data[$i] -> transaction_updated_date;
			$json_data[$i][3]['type']  = "date";

			$json_data[$i][4]['data']  = $data[$i] -> transaction_fixed_date;
			$json_data[$i][4]['type']  = "date";

			$json_data[$i][5]['data']  = $data[$i] -> transaction_amount;
			$json_data[$i][5]['type']  = "price";

			$json_data[$i][6]['data']  = $data[$i] -> transaction_switch;
			$json_data[$i][6]['type']  = "text";

			// status transaksi
			// 100 - Dalam Proses
			// 200 - Selesai
			// 300 - Dibatalkan
			$json_data[$i][7]['type']  = "badge";
			if($data[$i] -> transaction_status == 100){
				$json_data[$i][7]['data']  = "DALAM PROSES";
				$json_data[$i][7]['class'] = "badge badge-warning";
			}
			else if($data[$i] -> transaction_status == 200){
				$json_data[$i][7]['data']  = "SELESAI";
				$json_data[$i][7]['class'] = "badge badge-success";
			}
			else if($data[$i] -> transaction_status == 300){
				$json_data[$i][7]['data']  = "DIBATALKAN";
				$json_data[$i][7]['class'] = "badge badge-danger";
			}
		}

		// table header
		$json_header = [];
		$json_header[0] = "ID Transaksi";
		$json_header[1] = "Atas Nama";
		$json_header[2] = "Tanggal Dibuat";
		$json_header[3] = "Terakhir Diupdate";
		$json_header[4] = "Waktu Selesai";
		$json_header[5] = "Nominal Transaksi";
		$json_header[6] = "Switch";
		$json_header[7] = "Status";
		$json_settings = array('search_index' => 1);

		$output = array('raw_data'     => $json_data, 
						'table_header' => $json_header,
						'settings'     => $json_settings);
		
		return json_encode($output);
	}

	function getTransactionSales($dale, $id="NO_ID"){
		
		$array_data = array();
		$array_data['embed_item']  = getAllServicesAndProductData($dale);
		$array_data['embed_staff'] = getAllStaff($dale);
		$array_data['embed_name']  = getAllName($dale);

		if($id != "NO_ID"){
			$transaction = json_decode($dale -> kueri("SELECT * FROM `transaction` 
										               WHERE `transaction_id` = '".$id."'"));

			$items_arr = json_decode($dale -> kueri(getItemInTransactionKueri($dale, $id)));
			$transaction_data = array(
				'transaction_id'     => $transaction[0] -> transaction_id,
				'transaction_name'   => $transaction[0] -> transaction_name,
				'transaction_status' => $transaction[0] -> transaction_status,
				'transaction_disc'   => $transaction[0] -> transaction_disc,
				'transaction_switch' => $transaction[0] -> transaction_switch,
				'transaction_items'  => $items_arr
			);
			$array_data['transaction_data'] = $transaction_data;
		}

		return $array_data;
	}

	function addTransactionSales($dale, $data){	
		/*
			Transaction Data
			# transaction_body
				- transaction_id
				- transaction_mode ['new', 'update', 'fixed']
				- transaction_amount
			# transaction_items
		*/

		$request = json_decode($data);
		$transaction_body = $request -> transaction_body;
		$transaction_items = $request -> transaction_items;
		
		// check transaction validity
		/* jika transaksi sudah ada maka API akan berubah jadi mode update
		   jika belum ada, maka API akan berubah jadi mode new
		   fixed_date merupakan tanggal terakhir data dikunci, tidak ada perubahan lagi setelah tanggal itu 
		   fixed_date menyatakan transaksi sudah dibayar..
		   date merupakan tanggal transaksi dibuat
		*/

		$transaction_ = transactionAvailable($dale, $transaction_body -> transaction_id);

		// transaksi lama
		if($transaction_){
			if($transaction_body -> transaction_mode == 'update'){
				$transaction_body -> transaction_created_date = $transaction_ -> transaction_created_date;
				$transaction_body -> transaction_update_date  = $dale -> tanggalHariIni();
				$transaction_body -> transaction_fixed_date   = NULL;
				$transaction_body -> transaction_status = 100;
			}
			else if($transaction_body -> transaction_mode == 'fixed'){
				$transaction_body -> transaction_created_date = $transaction_ -> transaction_created_date;
				$transaction_body -> transaction_update_date = $dale -> tanggalHariIni();
				$transaction_body -> transaction_fixed_date  = $dale -> tanggalHariIni();
				$transaction_body -> transaction_status = 200;
			}
		}

		// transaksi baru
		else{
			if($transaction_body -> transaction_mode == 'fixed'){
				$transaction_body -> transaction_created_date = $dale -> tanggalHariIni();
				$transaction_body -> transaction_update_date  = $dale -> tanggalHariIni();
				$transaction_body -> transaction_fixed_date   = $dale -> tanggalHariIni();
				$transaction_body -> transaction_status = 200;
			}
			else{
				$transaction_body -> transaction_created_date = $dale -> tanggalHariIni();
				$transaction_body -> transaction_update_date  = $dale -> tanggalHariIni();
				$transaction_body -> transaction_fixed_date   = NULL;
				$transaction_body -> transaction_status       = 100;
			}
		}

		// tambah record transaksi baru
		$transactionStatus = $dale -> kueri(addTransactionSalesKueri($transaction_body));

		$transactionRemoveAll = $dale->kueri("DELETE FROM `transaction_detail` WHERE `transaction_id` = '".$transaction_body -> transaction_id."'");

		for($i = 0; $i < sizeof($transaction_items); $i++){
			$transactionAdd = $dale->kueri(addTransactionItemKueri($transaction_body -> transaction_id, $transaction_items[$i]));
		}
	}

	function getItemInTransactionKueri($dale, $transaction_id){
		$kueri  = "";
		$kueri .= "SELECT transaction_item_id as item_id, 
						  transaction_item as item_name, 
						  transaction_qty as item_qty, 
						  transaction_price as item_price, 
					      transaction_item_category as item_category, 
					      staff_id as item_handler_id, 
					      staff_name as item_handler 
					FROM `transaction_detail` as a ";
		$kueri .= "LEFT JOIN `master_staff` as b ";
		$kueri .= "ON a.transaction_handler = b.staff_id ";
		$kueri .= "WHERE `transaction_id` = '".$transaction_id."' ";
		return $kueri;
	}

	function addTransactionSalesKueri($data){
		$kueri  = "";
		$kueri .= "INSERT INTO `transaction` SET ";
		$kueri .= "transaction_id           = '".$data-> transaction_id."', ";
		$kueri .= "transaction_name         = '".$data-> transaction_name."', ";
		$kueri .= "transaction_amount       = '".$data-> transaction_amount."', ";
		$kueri .= "transaction_created_date = '".$data-> transaction_created_date."', ";
		$kueri .= "transaction_updated_date = '".$data-> transaction_update_date."', ";
		$kueri .= "transaction_fixed_date   = '".$data-> transaction_fixed_date."', ";
		$kueri .= "transaction_type         = 'TRX', ";
		$kueri .= "transaction_status       = '".$data-> transaction_status."', ";
		$kueri .= "transaction_disc         = '".$data-> transaction_disc."', ";
		$kueri .= "transaction_switch       = '".$data-> transaction_switch."', ";
		$kueri .= "created_by               = 'NULL', ";
		$kueri .= "updated_by               = 'NULL'";
		$kueri .= "ON DUPLICATE KEY UPDATE ";
		$kueri .= "transaction_name         = '".$data-> transaction_name."', ";
		$kueri .= "transaction_amount       = '".$data-> transaction_amount."', ";
		$kueri .= "transaction_created_date = '".$data-> transaction_created_date."', ";
		$kueri .= "transaction_updated_date = '".$data-> transaction_update_date."', ";
		$kueri .= "transaction_fixed_date   = '".$data-> transaction_fixed_date."', ";
		$kueri .= "transaction_type         = 'TRX', ";
		$kueri .= "transaction_status       = '".$data-> transaction_status."', ";
		$kueri .= "transaction_disc         = '".$data-> transaction_disc."', ";
		$kueri .= "transaction_switch       = '".$data-> transaction_switch."', ";
		$kueri .= "created_by               = 'NULL', ";
		$kueri .= "updated_by               = 'NULL'";
		return $kueri;
	}

	function addTransactionItemKueri($transaction_id, $item){
		$kueri  = "";
		$kueri .= "INSERT INTO `transaction_detail` SET ";
		$kueri .= "transaction_id     		 = '".$transaction_id."', ";
		$kueri .= "transaction_item_id 		 = '".$item -> item_id."', ";
		$kueri .= "transaction_item          = '".$item -> item_name."', ";
		$kueri .= "transaction_qty           = '".$item -> item_qty."', ";
		$kueri .= "transaction_item_category = '".$item -> item_category."', ";
		$kueri .= "transaction_price   		 = '".$item -> item_price."', ";
		$kueri .= "transaction_total   		 = '".intval($item -> item_price) * intval($item -> item_qty)."', ";
		$kueri .= "transaction_handler 		 = '".$item -> item_handler_id."' ";
		$kueri .= "ON DUPLICATE KEY UPDATE ";
		$kueri .= "transaction_item_id 		 = '".$item -> item_id."', ";
		$kueri .= "transaction_item          = '".$item -> item_name."', ";
		$kueri .= "transaction_qty           = '".$item -> item_qty."', ";
		$kueri .= "transaction_item_category = '".$item -> item_category."', ";
		$kueri .= "transaction_price   		 = '".$item -> item_price."', ";
		$kueri .= "transaction_total   		 = '".intval($item -> item_price) * intval($item -> item_qty)."', ";
		$kueri .= "transaction_handler 		 = '".$item -> item_handler_id."' ";
		return $kueri;
	}

	function transactionAvailable($dale, $id){
		$data = json_decode($dale->kueri("SELECT * FROM `transaction` WHERE `transaction_id` = '".$id."'"));
		if(sizeof($data) > 0){
			return $data[0];
		}
		return false;
	}

	function getAllServicesAndProductData($dale){
		$product = json_decode($dale->kueri("SELECT * FROM `master_product` WHERE `product_status` = 1"));
		$service = json_decode($dale->kueri("SELECT * FROM `master_services` WHERE `services_status` = 1"));

		$all_data = array();
		$i = 0;
		$counter_data = 0;

		for($i; $i < sizeof($product); $i++){
			$all_data[$counter_data] = array(
				'item_id'       => $product[$i] -> product_id,
				'item_name'     => $product[$i] -> product_name,
				'item_price'    => $product[$i] -> product_price,
				'item_stock'    => $product[$i] -> product_stock,
				'item_category' => "Produk"
			);
			$counter_data++;
		}

		$i = 0;
		for($i; $i < sizeof($service); $i++){
			$all_data[$counter_data] = array(
				'item_id'       => $service[$i] -> services_id,
				'item_name'     => $service[$i] -> services_name,
				'item_price'    => $service[$i] -> services_price,
				'item_stock'    => 'NO STOCK',
				'item_category' => 'Layanan ' . $service[$i] -> services_category,
				'item_handler'  => 'NOBODY'
			);
			
			$counter_data++;
		}

		return $all_data;
	}

	function getAllStaff($dale){
		$staff  = json_decode($dale->kueri("SELECT * FROM `master_staff` WHERE `staff_roles` != 'Kasir' AND `staff_roles` != 'Administrator'"));
		return $staff;
	}

	function getAllName($dale){
		$data = json_decode($dale -> kueri("SELECT DISTINCT `transaction_name` 
											FROM `transaction` 
											ORDER BY `transaction_name` ASC"));

		$names = [];
		for($i = 0; $i < sizeof($data);$i++){
			$names[$i] = $data[$i] -> transaction_name;
		}

		return $names;
	}

?>