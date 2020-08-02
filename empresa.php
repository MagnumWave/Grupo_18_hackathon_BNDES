<?php
include "dbconnect.php";
session_start();
$idEmpresa = $_POST['idTagEmpresa'];
$idUserCheck = $_SESSION['uID'];
//id da empresa é fornecido

$sql3 = "SELECT * FROM empresa
    JOIN endereco_e
    on endereco_e.id_empresa = empresa.idempresa
    WHERE empresa.idempresa='".$idEmpresa."'";
//query do join
$resultInfo = $conn->query($sql3);
//array associativo com todos os dados da empresa selecionada!
$row = mysqli_fetch_assoc($resultInfo);

$sql6 = "SELECT desconto FROM checkin
    WHERE checkin.id_usuario='".$idUserCheck."'";
//query do join

$resultCheck = $conn->query($sql6);
$row2 = mysqli_fetch_assoc($resultCheck);
//echo $row2['desconto'];


?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bairro Buddy</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="index.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="index.js"></script>

</head>
<body >
    <div class="container-fluid">
    <nav class="navbar navbar-default navbar-expand-lg ">
            <div class="navbar-header">
                <a class="navbar-brand" href="./home.php"><b>Bairro Buddy</b></a>  		
            </div>
            <!-- Collection of nav links, forms, and other content for toggling -->
            <div id="navbarCollapse" class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="./home.php">Home</a></li>
                </ul>                
                <ul class="nav navbar-nav navbar-right">			
                    <li ><a data-toggle="dropdown" class="dropdown-toggle" href="#">Login</a>
                        <!-- dropdown do login -->
                        <ul class="dropdown-menu form-wrapper">					
                            <li>
                            <!-- FORM DO LOGIN AQUI! -->
                                <form method="post" action="login.php">                                    
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="usuario" placeholder="Username" required="required">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" name="password" placeholder="Password" required="required">
                                    </div>
                                    
                                    <input type="submit" class="btn btn-primary btn-block" value="Login">
                                    <div class="form-footer">
                                        <a href="#">Forgot Your password?</a>
                                    </div>
                                </form>
                            </li>
                        </ul>
                        
                    </li>  
                    <li >
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">Registre-se</a>
                        <ul class="dropdown-menu">					
                            <li><a href="./registro_cliente.html" class="dropdown-link">Cliente</a></li>
                            <li><a href="./registro_empresa.html" class="dropdown-link">Empresa</a></li>
                        </ul>
                    </li>
                    <li>
                        <a data-toggle="" class="" href="#">
                          <?php
                            if(isset($_SESSION['uname'])){
                                echo "Olá, ".$_SESSION['uname']."!";
                            } else {
                               echo "Olá, Visitante!";
                            }
                                                              
                         ?></a>
                    </li>
                    <li>
                      <a data-toggle="" class="" href="logout.php">Sair</a>
                    </li>                  
                </ul>
            </div>
        </nav>
    </div>
    <div class="resultados">
        <table class="table table-light table-hover sortable">
                </thead>
                    <tr>
                        <td>Campo</td>
                        <td>Informação</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Nome </td><td><?php echo $row["nome"]; ?></td>
                    </tr>
                    <tr>
                        <td>Rua </td><td><?php echo $row["rua"]; ?></td>
                    </tr>
                    <tr>
                        <td>Nº </td><td><?php echo $row["numero"]; ?></td>
                    </tr>
                    <tr>
                        <td>Bairro </td><td><?php echo $row["bairro"]; ?></td>
                    </tr>
                    <tr>
                        <td>Cidade </td><td><?php echo $row["cidade"]; ?></td>
                    </tr>
                    <tr>
                        <td>Estado </td><td><?php echo $row["estado"]; ?></td>
                    </tr>
                    <tr>
                        <td>Site </td><td><?php echo $row["site"]; ?></td>
                    </tr>
                    <tr>
                        <td>Descrição </td><td><?php echo $row["descricao"]; ?></td>
                    </tr>
                </tbody>
            </table>
    
        <!-- deve ser melhor mostrar essa lista horizontalmente -->
        <ul>
            <li>
            <form id="myForm" action="fazcheckin.php" method="post" onclick="this.submit()">
                              <select name="empresa" size="-1">
                              <option style='display: none' value="<?php echo $idEmpresa; ?>" selected>
                              
                              Faz Checkin
                              
                              </option></select>
                              <select style='display: none' name="usuario" size="-1">
                              <option style='display: none' value="<?php echo "{$_SESSION['uID']}"; ?>" selected>
                              
                              Faz Checkin
                              
                              </option></select>
                          </form>
            </li>
            <?php
                if(isset($_SESSION['uname'])){
                    if($row2['desconto']==0){
                        echo "sem desconto";
                    } else {
                        echo "com desconto";
                    }
                    //quem loga, vê
                    //aqui mostra se o usuario logado tem desconto
                } else {
                    echo "<li>quem não loga, não vê!</li>";
                }
            ?>
        </ul>
    </div>
    
</body>
