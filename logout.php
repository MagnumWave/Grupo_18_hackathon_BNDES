<?php
    session_start();
    session_unset();
    session_destroy();
    echo "<a href='home.php'>Voltar</a>";
?>
