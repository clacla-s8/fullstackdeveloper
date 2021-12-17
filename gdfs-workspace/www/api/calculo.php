<?php

require_once('conexao.php');

function calcularTarifa($categoria_id, $cidade_id, $endereco_origem, $endereco_destino)
{

    $pdo = Conexao();
    $sql = "SELECT bandeirada, valor_hora, valor_km FROM categoria WHERE id = $categoria_id ";
    $statement = $pdo->prepare($sql);

    $statement->execute();
    $resultCategoria = $statement->fetchAll();
    $distancia = rand(0, 100);
    $duracao = rand(0, 60);



    foreach ($resultCategoria as $key => $value) {
        $bandeirada = $value['bandeirada'];
        $valor_hora =  $value['valor_hora'];
        $valor_km = $value['valor_km'];
    }


    $tarifa = $bandeirada + $valor_hora + $valor_km * $duracao + $valor_km * $distancia;

    return $tarifa;
}
