<?php
//incrementa o checkin no banco de dados e volta pra Home
include "dbconnect.php";
session_start();
$uidcheck = $_POST['empresa'];
$eidcheck = $_POST['usuario'];
$sql3 = "UPDATE checkin 
SET checkin_contagem = checkin_contagem + 1 
WHERE id_usuario = 1";

$conn->query($sql3);

echo "<a href='home.php'>Voltar</a>";

?>