<?php

	require '../api_conf.php';
	
	$data = "";
	$json_data = [];

	if(isset($_GET['id'])){
		$data = $dale->kueri("SELECT * FROM `master_staff` WHERE `staff_id` = '".$_GET['id']."'");
		
		$data = json_decode($data);

		for($i = 0; $i < sizeof($data); $i++){

			$json_data[$i][0]['data']  = $data[$i] -> staff_id;
			$json_data[$i][0]['type']  = "id";

			// staff name
			$json_data[$i][1]['data']  = $data[$i] -> staff_name;
			$json_data[$i][1]['type']  = "text";
			$json_data[$i][1]['class'] = "";

			// staff name
			$json_data[$i][2]['data']  = $data[$i] -> staff_username;
			$json_data[$i][2]['type']  = "text";
			$json_data[$i][2]['class'] = "";

			// staff roles
			$json_data[$i][3]['data']  = $data[$i] -> staff_password;
			$json_data[$i][3]['type']  = "text";
			$json_data[$i][3]['class'] = "";

			// staff roles
			$json_data[$i][4]['data']  = $data[$i] -> staff_roles;
			$json_data[$i][4]['type']  = "text";
			$json_data[$i][4]['class'] = "";

			// staff status
			$json_data[$i][5]['data']  = $data[$i] -> staff_status;
			$json_data[$i][5]['value'] = $data[$i] -> staff_status;
			$json_data[$i][5]['type']  = "badge_radio";

			if($data[$i] -> staff_status == 1){
				$json_data[$i][5]['class'] = "success";
				$json_data[$i][5]['value'] = "Aktif";
			}
			else{
				$json_data[$i][5]['class'] = "danger";
				$json_data[$i][5]['value'] = "Tidak Aktif";
			}	
			
		}
	}

	else{
		$data = $dale->kueri("SELECT * FROM `master_staff` ORDER BY `staff_name` ASC");
	
		$data = json_decode($data);
	
		for($i = 0; $i < sizeof($data); $i++){

			$json_data[$i][0]['data']  = $data[$i] -> staff_id;
			$json_data[$i][0]['type']  = "id";

			// staff name
			$json_data[$i][1]['data']  = $data[$i] -> staff_name;
			$json_data[$i][1]['type']  = "text";
			$json_data[$i][1]['class'] = "";

			// staff roles
			$json_data[$i][2]['data']  = $data[$i] -> staff_roles;
			$json_data[$i][2]['type']  = "text";
			$json_data[$i][2]['class'] = "";

			// staff status
			$json_data[$i][3]['data']  = $data[$i] -> staff_status;
			$json_data[$i][3]['value'] = $data[$i] -> staff_status;
			$json_data[$i][3]['type']  = "badge_radio";

			if($data[$i] -> staff_status == 1){
				$json_data[$i][3]['class'] = "badge badge-success";
				$json_data[$i][3]['value'] = "Aktif";
			}
			else{
				$json_data[$i][3]['class'] = "badge badge-danger";
				$json_data[$i][3]['value'] = "Tidak Aktif";
			}
			
		}
	}
	
	if(isset($_GET['id'])){
		echo json_encode($json_data);
	}

	else{
		// table header
		$json_header = [];
		$json_header[0] = "ID Staff";
		$json_header[1] = "Nama Staff";
		$json_header[2] = "Roles";
		$json_header[5] = "Status";
		$json_settings = array('search_index' => 1);

		$output = array('raw_data'     => $json_data, 
						'table_header' => $json_header,
						'settings'     => $json_settings);
		echo json_encode($output);
	}
	

?>