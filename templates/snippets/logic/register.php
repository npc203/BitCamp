<?php 
include('dbconfig.php');


if(isset($_POST['submit']))
{
  
  $email = $_POST['email'];
  $password = $_POST['password'];
  $confirm_password = $_POST['cpassword'];
  
      $query = "INSERT INTO login (email,password) VALUES ('$email','$password')";
      $query_run = mysqli_query($conn, $query);

      if($query_run)
      {

         
          echo "<script type='text/javascript'>alert('Registration Success');
        window.location.href='../../../final.html';
        </script>";
          
          
      }
      else
      {
        echo 'failed';
        
         
      }
  
  
}




















// if(isset($_POST['sumbit'])){
//     $email = $_POST['email'];
//     $password = $_POST['password'];
//     $cpassword = $_POST['cpassword'];

//     echo $email;
//     echo $password;
// 		$stmt = $conn->prepare("INSERT INTO login (email,password) VALUES (?, ?)");
// 		$stmt->bind_param("ss",$email,$password );
// 		$stmt->execute();

//         echo "<script type='text/javascript'>alert('Registration Success . Please Login.');
//         window.location.href='../index.php';
        
//         </script>";
        

// 	// else {
//         // echo "<script type='text/javascript'>alert('Email Already Exists ');
//         // window.location.href='../index.php';
        
//         // </script>";
// 	// }


// }




?>