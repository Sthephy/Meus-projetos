<?php
    $servidor = 'localhost';
    $usuario = 'root';
    $senha = '3TH3ph4n1';
    $banco = 'BD_A';

    $cn = new PDO("mysql:host=$servidor;dbname=$banco",$usuario,$senha);
?>
