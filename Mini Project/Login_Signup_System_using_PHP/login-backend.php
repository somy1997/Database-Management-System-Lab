<?php

$con = mysqli_connect("localhost","DB_USER","DB_PASSWORD","DB_NAME");

$email = $_POST["email"];
$password = $_POST["password"];

$password = md5($password);

$query = "SELECT * FROM users WHERE email='$email' AND password='$password'";
$result = mysqli_query($con, $query);

$get = mysqli_fetch_assoc($result);
$numResults = mysqli_num_rows($result);

if($numResults == 1)
{
	$query = "UPDATE users SET login_count = login_count + 1 WHERE email='$email'";
	mysqli_query($con, $query);
	echo "<br><br><br><center><h1>Hi ".$get["name"]."!</h1></center>";
}
else
{
	echo "<br><br><br><center><h1>Invalid credentials!</h1></center>";
}

?>
