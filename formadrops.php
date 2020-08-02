<?php 
include "dbconnect.php";
//include "query.php";
$sqlDrops = "SELECT DISTINCT tipo from empresa";
//empresa tem tipo

$resultTipo = $conn->query($sqlDrops);

//segunda query pros drops

$sqlDrops = "SELECT DISTINCT bairro from endereco_e";
//empresa tem tipo

$resultBairro = $conn->query($sqlDrops);

/*if ($resultTipo->num_rows > 0) {
    // output pra cada tupla
    while($row = $resultTipo->fetch_assoc()) {
        
      //echo "nome: ".$row["nome"]. "<br>";
      echo "<script>document.getElementById('')</script>";
    }
  } else {
    echo "Desculpa, mas esse nome não existe aqui. (0 results)";
};*/
//$conn->close();

?>