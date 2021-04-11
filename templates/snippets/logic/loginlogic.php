<?php

include('dbconfig.php');
if(isset($_POST['submit']))
{
  $email_login = $_POST['email'];
  $passwd_login = $_POST['password'];
  


  $query = "SELECT * FROM login WHERE email = '$email_login' AND password='$passwd_login' ";
  $query_run = mysqli_query($conn,$query);
  
    if($query_run){
        echo "<script type='text/javascript'>alert('Login Success');
        window.location.href='../dashboard.php';
        
        </script>";
          
        
    }
    else{
        echo 'failed';
    }

  
  





}
?>