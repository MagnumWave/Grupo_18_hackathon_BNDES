<?php
include "dbconnect.php";
session_start();
$usuario = $_POST['usuario'];
$senha = $_POST['password'];
$sql4 = "SELECT * FROM usuario
    WHERE usuario.nome='".$usuario."'";
$resultUser = $conn->query($sql4);
$row = mysqli_fetch_assoc($resultUser);
echo $usuario;
echo $senha;
echo $row['nome'];
if($usuario != $row['nome']){
    //não existe esse usuario no BD
    echo "não!";
} else if ($senha != $row['senha']){
    //esse usuario tá com a senha errada
    echo "não!";
} else {
    //agora ele foi devidamente reconhecido e o vai iniciar a sessão!
    echo "deu certo!";
    
    $_SESSION['uname'] = $usuario;
    $_SESSION['uID'] = $row['idusuario'];
    echo $_SESSION['uID'];
    
}
echo "<a href='home.php'>Voltar</a>";

?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservas</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="index.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="index.js"></script>

</head>

<h1>tela de quem acabou de tentar logar</h1>
