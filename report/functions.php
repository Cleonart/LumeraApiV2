<?php
	
	require '../api_conf.php';

	function getSelling($dale, $start_date, $end_date){
		$data = json_decode($dale->kueri(getProductSellingKueri($start_date, $end_date)));
		$price = 0;
		$graph_data = [];

		$before_price = 0;
		$before_date  = "";
		$graph_index  = -1;

		// memecah array dan menghitung pendapatan
		for($i=0; $i < sizeof($data); $i++){
			$now_date = $data[$i] -> transaction_fixed_date;

			// jika sama hanya menambahkan harga
			if($now_date == $before_date){
				$before_price += $data[$i] -> transaction_amount;
				$graph_data['value'][$graph_index] = $before_price;
			}

			// jika tidak sama, daftarkan tanggal baru
			else{
				$graph_index++;
				$before_price = $data[$i] -> transaction_amount;
				$graph_data['date'][$graph_index] = $now_date;
				$graph_data['value'][$graph_index] = $before_price;
				$before_date  = $now_date;
			}
			
			$price += $data[$i] -> transaction_amount;
		}

		$datasets[0] = array('label' => 'Penjualan', 'data' => $graph_data['value']);
		$chart_data  = array('datasets' => $datasets, 'labels' => $graph_data['date']);
		return array('chart_data' => $chart_data, 'total' => $price, 'total_transaksi' => $i);
	}

	function getProductSellingKueri($start_date, $end_date){
		$kueri = "";
		$kueri .= "SELECT * FROM `transaction` ";
		$kueri .= "WHERE `transaction_fixed_date` ";
		$kueri .= "BETWEEN '".$start_date."' AND '".$end_date."' AND ";
		$kueri .= "`transaction_type` = 'TRX' ";
		$kueri .= "ORDER BY `transaction_fixed_date` DESC";
		return $kueri;
	}
	
?>