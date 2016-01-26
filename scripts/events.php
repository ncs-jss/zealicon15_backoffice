<?php 
	if (session_status() == PHP_SESSION_NONE) {
    session_start();
	}

	include_once $_SERVER['DOCUMENT_ROOT'].'/common-code/db.php';
	if(isset($_POST['type']) && $_POST['type'] == 'add')
		addEvent();
	if(isset($_POST['type']) && $_POST['type'] == 'delete')
		deleteEvent();
	if(isset($_POST['type']) && $_POST['type'] == 'edit')
		editEvent();

	function addEvent(){
		$conn = dbConnect();
		$filePath = '';$eventTime='';$event_name='';$category='';$about='';$desc='';$prize1='';$prize2='';$contact1='';$contact2='';$link='';$rules=array();
		if(isset($_POST['event_name'])) $event_name = $conn->real_escape_string($_POST['event_name']);
		if(isset($_POST['category'])) $category = $conn->real_escape_string($_POST['category']);
		if(isset($_POST['about'])) $about = $_POST['about'];
		if(isset($_POST['description'])) $desc = $_POST['description'];
		if(isset($_POST['eventTime'])) $eventTime = $_POST['eventTime'];
		if(isset($_POST['prize1'])) $prize1 = $_POST['prize1'];
		if(isset($_POST['prize2'])) $prize2 = $_POST['prize2'];
		if(isset($_POST['contact1'])) $contact1 = $_POST['contact1'];
		if(isset($_POST['contact2'])) $contact2 = $_POST['contact2'];
		if(isset($_POST['link'])) $link = $_POST['link'];
		if(isset($_POST['rules'])) $rules = $_POST['rules'];
		$societyId = $_SESSION['user']['id'];
		if(isset($_FILES['file']) && $_FILES['file']['error'] != 4)
		{
			$fileNameArray = explode('.', $_FILES["file"]['name']);
			$_FILES['file']['name'] = $fileNameArray[0].''.trim(str_replace(' ', '', $event_name)).'.'.$fileNameArray[1];
			$target_dir = "../uploads/events/";
			$target_file = $target_dir . basename($_FILES["file"]["name"]);
			if(move_uploaded_file($_FILES["file"]["tmp_name"], $target_file))
			{
				$filePath = 'uploads/events/'.$_FILES["file"]["name"];
			}
		}
		$display = 0;
		$eventData = array(
			'about' => $about,
			'prize1' => $prize1,
			'prize2' => $prize2,
			'contact1' => $contact1,
			'contact2' => $contact2,
			'link' => $link,
			'rules' => $rules,
			'filePath' => $filePath,
			'description' => $desc
		);
		$eventData = json_encode($eventData);
		$sql = "INSERT INTO events (societyId,eventData,category,name,display,eventTime) VALUES (".$societyId.",'".$eventData."','".$category."','".$event_name."',".$display.",'".$eventTime."')";
		$result = $conn->query($sql);
		dbDisconnect($conn);
		if($result){
			header("location:../events.php");
		}
		else{
			echo "Some error occured..:(";
		}
	}

	function events(){
		$conn = dbConnect();
		$id = -1;
		if(isset($_SESSION['user']['id'])) $id = $_SESSION['user']['id'];
		$data = array();
		$sql = "SELECT * FROM events WHERE societyId=".$id;
		$result = $conn->query($sql);
		if ($result->num_rows > 0){
			while($row = $result->fetch_assoc())
			{
				$row['data'] = base64_encode(json_encode($row));
				$data[] = $row;
			}
		}
		return $data;
		dbDisconnect($conn);
	}

	function deleteEvent(){
		$id = -1;
		if(isset($_POST['id'])) $id = $_POST['id'];
		$conn = dbConnect();
		$sql = "DELETE FROM events WHERE id=".$id;
		$result = $conn->query($sql);
		if($result) echo 1;
		else echo 0;
	}


	function editEvent(){
		$conn = dbConnect();
		$societyId=-1;$id=-1;$display=0;$eventTime='';$filePath = '';$event_name='';$category='';$about='';$desc='';$prize1='';$prize2='';$contact1='';$contact2='';$link='';$rules=array();
		if(isset($_POST['event_name'])) $event_name = $conn->real_escape_string($_POST['event_name']);
		if(isset($_POST['category'])) $category = $conn->real_escape_string($_POST['category']);
		if(isset($_POST['about'])) $about = $_POST['about'];
		if(isset($_POST['description'])) $desc = $_POST['description'];
		if(isset($_POST['prize1'])) $prize1 = $_POST['prize1'];
		if(isset($_POST['prize2'])) $prize2 = $_POST['prize2'];
		if(isset($_POST['eventTime'])) $eventTime = $_POST['eventTime'];
		if(isset($_POST['contact1'])) $contact1 = $_POST['contact1'];
		if(isset($_POST['contact2'])) $contact2 = $_POST['contact2'];
		if(isset($_POST['link'])) $link = $_POST['link'];
		if(isset($_POST['rules'])) $rules = $_POST['rules'];
		if(isset($_POST['id'])) $id = $_POST['id'];
		if(isset($_POST['societyId'])) $societyId = $_POST['societyId'];
		if(isset($_POST['filePath']) && $_POST['filePath'] != '') $filePath = $_POST['filePath'];
		if(isset($_POST['display'])) $display = $_POST['display'];
		if(isset($_FILES['file']) && $_FILES['file']['error'] != 4)
		{
			$fileNameArray = explode('.', $_FILES["file"]['name']);
			$_FILES['file']['name'] = $fileNameArray[0].''.trim(str_replace(' ', '', $event_name)).'.'.$fileNameArray[1];
			$target_dir = "../uploads/events/";
			$target_file = $target_dir . basename($_FILES["file"]["name"]);
			if(move_uploaded_file($_FILES["file"]["tmp_name"], $target_file))
			{
				$filePath = 'uploads/events/'.$_FILES["file"]["name"];
			}
		}
		$eventData = array(
			'about' => $about,
			'prize1' => $prize1,
			'prize2' => $prize2,
			'contact1' => $contact1,
			'contact2' => $contact2,
			'link' => $link,
			'rules' => $rules,
			'filePath' => $filePath,
			'description' => $desc
		);
		$eventData = json_encode($eventData);
		$sql = "UPDATE events SET societyId=".$societyId.",eventData='".$eventData."',category='".$category."',name='".$event_name."',display=".$display.",eventTime='".$eventTime."' WHERE id=".$id."";
		$result = $conn->query($sql);
		dbDisconnect($conn);
		if($result){
			header("location:../events.php");
		}
		else{
			echo "Some error occured..:(";
		}
	}
?>