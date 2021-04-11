<?php 
if(isset($_POST['sumbit'])){
    $email = $_POST['email'];
    $password = $_POST['password'];
    $cpassword = $_POST['cpassword'];

		$stmt = $conn->prepare("INSERT INTO login (email,password) VALUES (?, ?)");
		$stmt->bind_param("ss",$email,$password);
		if($stmt->execute()){

        echo "<script type='text/javascript'>alert('Registration Success . Please Login.');
        window.location.href='';
        
        </script>";
        }

	else {
        echo "<script type='text/javascript'>alert('Email Already Exists ');
        window.location.href='';
        
        </script>";
	}


}




?>