<?php

include 'dbconnect.php';
//variaveis pra capturar
$servLocal = $_POST['postLocal'];
$servBairro = $_POST['postBairro'];


//criação da query
$sql = "SELECT * from empresas
JOIN endereco_e
ON endereco_e.id_empresa = empresas.idempresa";




$resultQuery = $conn->query($sql);

print_r($resultQuery);

if ($resultQuery->num_rows > 0) {
    // output pra cada tupla
    while($row = $resultQuery->fetch_assoc()) {
      //echo "nome: ".$row["nome"]. "<br>";
      $finalOutput .= "<tr>
      <td>".$row['nome']."</td>
      <td>".$row['bairro']."</td>
      <td></td>
      <td><a href='#' class='btn' data-toggle='modal' data-target='#basicModal'>
          Click to open Modal
        </a></td>
    </tr>";
      /*echo "<tr>
      <td>autback</td>
      <td>Barra da Tijuca</td>
      <td></td>
      <td><a href='#' class='btn' data-toggle='modal' data-target='#basicModal'>
          Click to open Modal
        </a></td>
    </tr>";*/
    }
  } else {
    echo "Desculpa, mas esse nome não existe aqui. (0 results)";
};
echo $finalOutput; //cospe uma stringona como esperado
//$conn->close();
?>