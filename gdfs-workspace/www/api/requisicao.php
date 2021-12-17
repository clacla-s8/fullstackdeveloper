<?php

require_once('conexao.php');

function getCidades(){
    $pdo = Conexao();
    $sql = 'SELECT nome FROM cidade';
    $statement = $pdo->prepare($sql);

    $statement->execute();

    json_encode($statement->fetchAll(PDO::FETCH_ASSOC));
    $pdo = null;

}

function getCategorias(){

    $pdo = Conexao();
    $sql = 'SELECT categoria FROM categoria';
    $statement = $pdo->prepare($sql);

    $statement->execute();

    json_encode($statement->fetchAll(PDO::FETCH_ASSOC));
    $pdo = null;

}

function verificarCategoriasDaCidade($cidade_id, $categoria_id){
    $pdo = Conexao();
    $sql = 'SELECT * FROM cidade_categoria WHERE cidade_id = ? AND categoria_id = ?';
    $statement = $pdo->prepare($sql);

    $statement->execute();

    json_encode($statement->fetchAll(PDO::FETCH_ASSOC));
    $pdo = null;
}