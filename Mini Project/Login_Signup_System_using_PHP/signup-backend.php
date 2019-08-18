<?php

$con = mysqli_connect("localhost","DB_USER","DB_PASSWORD","DB_NAME");

$name = $_POST["name"];
$email = $_POST["email"];
$password = $_POST["password"];

$password = md5($password);

$query = "SELECT * FROM users WHERE email='$email'";
$result = mysqli_query($con, $query);
$numResults = mysqli_num_rows($result);

if($numResults == 1)
{
	echo "<br><br><br><center><h1>Already registered!</h1></center>";
}
else
{
	$query = "INSERT INTO users (email, password, name, login_count) VALUES ('$email', '$password', '$name', '0')";
	mysqli_query($con, $query);
	echo "<br><br><br><center><h1>Successfully registered!</h1></center>";
}

?>
