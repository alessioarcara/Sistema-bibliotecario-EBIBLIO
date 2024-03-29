<?php
include_once('../db_conn/db.php');
$pdo = db::getInstance();
$sql = 'SELECT * FROM getregistrazioni()';

try {
    $results = $pdo->query($sql);
    $registrazioni = $results->fetch(\PDO::FETCH_ASSOC);

    if ($registrazioni['getregistrazioni']) {
        http_response_code(200);
        echo json_encode($registrazioni);
    } else {
        http_response_code(404);
        echo 'nessuna biblioteca trovata';
    }
} catch (Exception $e) {
    http_response_code(400);
    echo 'Er: '.$e->getMessage();
}