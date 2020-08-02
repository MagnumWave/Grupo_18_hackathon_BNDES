<?php
include "dbconnect.php";
//aqui não pode rolar conflito!!

$sql5 = "INSERT INTO usuario 
    (nome, 
    cpf, 
    nascimento,
    sexo,
    telefone,
    email,
    senha)
    VALUES 
    ('John',
    'Doe',
    'john@example.com')";

$sql6 = "INSERT INTO telefone 
(numero 
)
VALUES 
('John',
'Doe',
'john@example.com')";

$sql7 = "INSERT INTO endereco_u 
    (rua, 
    numero, 
    complemento,
    bairro,
    cidade,
    estado,
    cep)
    VALUES 
    ('John',
    'Doe',
    'john@example.com')";

if ($conn->query($sql5) === TRUE) {
  echo "New record created successfully";
} else {
  echo "Error: " . $sql5 . "<br>" . $conn->error;
}
?>