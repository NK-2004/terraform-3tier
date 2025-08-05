<?php
$host = "RDS-ENDPOINT-HERE";
$user = "admin";
$pass = "password123";
$dbname = "mydb";

$conn = new mysqli($host, $user, $pass, $dbname);
if ($conn->connect_error) die("Connection failed");

$name = $_POST['name'];
$email = $_POST['email'];

$sql = "INSERT INTO users (name, email) VALUES ('$name', '$email')";
$conn->query($sql);
echo "Registration successful!";
?>

