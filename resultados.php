<?php
    //variaveis pra capturar
    include "dbconnect.php";
    session_start();
    $local = $_POST['select-localidade'];
    $tipo = $_POST['select-tipo'];

    if($local != "todas" && $tipo != "todas"){
      $sql1 = "SELECT * FROM empresa
    JOIN endereco_e
    on endereco_e.id_empresa = empresa.idempresa
    WHERE bairro='{$local}' AND tipo='{$tipo}'";

    } elseif($local == "todas" && $tipo != "todas") {
      $sql1 = "SELECT * FROM empresa
    JOIN endereco_e
    on endereco_e.id_empresa = empresa.idempresa
    WHERE tipo='{$tipo}'";
    } elseif($local != "todas" && $tipo == "todas") {
      $sql1 = "SELECT * FROM empresa
    JOIN endereco_e
    on endereco_e.id_empresa = empresa.idempresa
    WHERE bairro='{$local}'";
    } else {
      $sql1 = "SELECT * FROM empresa
    JOIN endereco_e
    on endereco_e.id_empresa = empresa.idempresa";
    }


    //criação da query
    /*$sql1 = "SELECT * FROM empresa
    JOIN endereco_e
    on endereco_e.id_empresa = empresa.idempresa";*/

    echo $local;
    echo $tipo;

    $result = $conn->query($sql1);
    
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
<body >
    <div class="container-fluid">
    <nav class="navbar navbar-default navbar-expand-lg ">
            <div class="navbar-header">
                <a class="navbar-brand" href="#"><b>Nome</b></a>  		
            </div>
            <!-- Collection of nav links, forms, and other content for toggling -->
            <div id="navbarCollapse" class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="./home.html">Home</a></li>
                    <li><a href="./registro_cliente.html">About</a></li>
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
        <!-- HOME SEM DROPDOWN -->
        <!-- TABELA AQUI -->
        </br>
            <table class="table table-light table-hover sortable" id="tabela">
                <thead>
                  <tr>
                    <th scope="col" onclick="sortTable(0)" style="cursor: pointer;">Nome</th>
                    <th scope="col" onclick="sortTable(1)" style="cursor: pointer;">Bairro</th>
                    <th scope="col" >URL</th>
                    <th scope="col" >Reservar</th>
                  </tr>
                </thead>
                <tbody>
                  <?php
                    if ($result->num_rows > 0) {
                      // output pra cada tupla
                      while($row = $result->fetch_assoc()) {
                        //o form envia o ID do estabelecimento pro empresa.php
                        //forma estranha de enviar formulário, mas funciona!
                        echo "<tr>
                        <td>".$row["nome"]. "</td>
                        <td>".$row["bairro"]. "</td>
                        <td></td>
                        <td>
                          <form id='myForm' action='empresa.php' method='post' onclick='this.submit()'>
                              <select name='idTagEmpresa' size='-1'>
                              <option style='display: none' value='".$row["id_empresa"]."' selected>
                              
                              Ver Estabelecimento
                              
                              </option></select>
                          </form>
                        </td>
                      </tr>";
                        }
                      } else {
                        echo "<tr>
                        <td></td>
                        <td> Desculpa, não tem locais aqui.</td>
                        <td></td>
                        <td><a href='#' class='btn' >
                            Sem Modal também
                          </a></td>
                      </tr>";
                    };
                  ?>
                </tbody>
              </table>
        </div>
        <!-- MODAL era AQUI -->   
                  
    </div>
</body>
</html>