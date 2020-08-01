<?php 
//pega as variaveis
$uvar = $_POST['uname'];
$pwvar = $_POST['pwd'];
$uname = $uvar; 
$pwd = $pwvar; //uma transição de variaveis

//echo $uname; 

session_start();

if(isset($_SESSION['uname'])) {
    // echo de boas vindas
    echo "<h1>bemvindo". $_SESSION['uname'] ."</h1>";
    echo "<a href='produto.php'>Produto</a><br>"; //
    echo "<br><a href='logout.php'><input type='button' value='logout' name='logout'></a><br>";
} else {
    if( $_POST['uname']==$uname && $_POST['pwd']==$pwd ) {
        $_SESSION['uname'] = $uname;
        echo "<script>location.href='welcome.php'</>";
    } else {
        echo "<script>alert('usuario ou senha inválidos')</script>";
    };
};


?>