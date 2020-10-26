<?php

	header('Access-Control-Allow-Origin: *');

	require '../api_conf.php';

	
	function getTransactionSales($dale){

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
		$transaction_body  = $request -> transaction_body;
		$transaction_items = $request -> transaction_items;
		
		// check transaction validity
		/* jika transaksi sudah ada maka API akan berubah jadi mode update
		   jika belum ada, maka API akan berubah jadi mode new
		   fixed_date merupakan tanggal terakhir data dikunci, tidak ada perubahan lagi setelah tanggal itu 
		   fixed_date menyatakan transaksi sudah dibayar..
		   date merupakan tanggal transaksi dibuat
		*/

		// transaksi lama
		if(transactionAvailable($dale, $transaction_body -> transaction_id)){
			if($transaction_body -> transaction_mode == 'update'){
				$transaction_body['transaction_update_date'] = $dale -> tanggalHariIni();
				$transaction_body['transaction_fixed_date']  = NULL;
			}
			else if($transaction_body -> transaction_mode == 'fixed'){
				$transaction_body['transaction_update_date'] = $dale -> tanggalHariIni();
				$transaction_body['transaction_fixed_date']  = $dale -> tanggalHariIni();
			}
		}

		// transaksi baru
		else{
			$transaction_body['transaction_created_date'] = $dale -> tanggalHariIni();
			$transaction_body['transaction_update_date']  = $dale -> tanggalHariIni();
			$transaction_body['transaction_fixed_date']   = NULL;
		}
		
		// tambah record transaksi baru
		$transactionStatus = $dale -> kueri(addTransactionSalesKueri($transaction_body));
	}

	function addTransactionSalesKueri($data){
		$kueri  = "";
		$kueri .= "INSERT INTO `transaction` SET ";
		$kueri .= "transaction_id           = '".$data-> transaction_id."', ";
		$kueri .= "transaction_amount       = '".$data-> transaction_amount."', ";
		$kueri .= "transaction_status       = '".$data-> transaction_status."', ";
		$kueri .= "transaction_created_date = '".$data-> transaction_created_date."', ";
		$kueri .= "transaction_updated_date = '".$data-> transaction_update_date."', ";
		$kueri .= "transaction_fixed_date   = '".$data-> transaction_fixed_date."', ";
		$kueri .= "transaction_served_by    = '".$data-> transaction_status."', ";
		$kueri .= "created_by               = 'NULL', ";
		$kueri .= "updated_by               = 'NULL', ";
		$kueri .= "ON DUPLICATE KEY UPDATE ";
		return $kueri;
	}

	function transactionAvailable($dale, $id){
		$data = json_decode($dale->kueri("SELECT * FROM `transaction` WHERE `transaction_id` = '".$id."'"));
		if(sizeof($data) > 0){
			return true;
		}
		return false;
	}

?>