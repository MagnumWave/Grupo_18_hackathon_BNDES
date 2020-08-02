<?php
    //include formador de dropdown
    include "formadrops.php";
    session_start();
    
    
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
        <div class="estabelecimentos">
            <form class="filtroEstabelecimento" action="resultados.php" method="post">
                <label style="padding-left: 10px;">Área</label>
                <select name="select-localidade" class="ls-select" style="width:300px" data-search="false">
                    <option value="todas">Todas</option>
                    <?php
                        /* aqui entra um echo formador de tags option
                        isso é pra fazer uso dos dados que existem no BD
                        ele vai ser sempre formado quando a página carrega porque será
                        importado logo no começo do Doc. (select distinct)
                        */
                        if ($resultBairro->num_rows > 0) {
                            while($row = $resultBairro->fetch_assoc()) {
                                
                              echo "<option value='".$row['bairro']."'>".$row['bairro']."</option>";
                            }
                          } else {
                            echo "Desculpa, mas esse nome não existe aqui. (0 results)";
                        };
                    ?>
                    <!--<option value="norte">Zona Norte</option>
                    <option value="oeste">Zona Oeste</option>
                    <option value="sul">Zona Sul</option>-->
                </select>
                <label style="padding-left: 10px;">Tipo</label>
                <select name="select-tipo" class="ls-select" style="width:300px" data-search="false">
                    <option value="todas">Todas</option>
                    <?php
                        /* aqui entra um echo formador de tags option
                        isso é pra fazer uso dos dados que existem no BD
                        ele vai ser sempre formado quando a página carrega porque será
                        importado logo no começo do Doc. (select distinct)
                        */
                        if ($resultTipo->num_rows > 0) {
                            while($row = $resultTipo->fetch_assoc()) {
                              echo "<option value='".$row['tipo']."'>".$row['tipo']."</option>";
                            }
                          } else {
                            echo "Desculpa, mas esse nome não existe aqui. (0 results)";
                        };
                    ?>
                    <!--<option value="restaurante">Restaurantes</option>
                    <option value="lanchonetes">Lanchonetes</option>
                    <option value="sul">Zona Sul</option>-->
                </select>
                <input type="submit" value="Pesquisar">
                
            </form>
            
        </div>
        <!-- fim do estabelecimentos-->
        
        
    </div>
</body>
</html>