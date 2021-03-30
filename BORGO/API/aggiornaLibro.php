<?php 

//connect to db
$host='argonauta.synology.me';
$db = 'unibo';
$username = 'postgres';
$password = 'postgres';
$dsn = "pgsql:host=$host; port=5444; dbname=$db; user=$username; password=$password";
$pdo = new PDO($dsn);

$request = [];
foreach ($_POST as $key => $value) {
  $request[$key] = filter_input(INPUT_POST, $key, FILTER_SANITIZE_SPECIAL_CHARS);
};
$codiceLibro = $request['codice'];
$titolo = $request['titolo'];
$edizione = $request['edizione'];
$anno = $request['anno'];
$genere = $request['genere'];
$emailAdmin = $_COOKIE['email'];
$sql = "SELECT nomebiblioteca FROM AMMINISTRATORE 
        WHERE emailamministratore='$emailAdmin'";
$result = $pdo->query($sql);
$biblioteca = $result->fetch(\PDO::FETCH_ASSOC)['nomebiblioteca'];

$sql = 
  "SELECT aggiornamentoLibroAmministratore(
    '$emailAdmin',
    '$codiceLibro',
    '$titolo',
    '$edizione',
    '$anno',
    '$genere',
    '$biblioteca'
  )";

try {
  $result = $pdo->query($sql);
  $status = $result->fetch(\PDO::FETCH_ASSOC);
  // file_put_contents('php://stderr', print_r($status, TRUE));
  if ($status['aggiornamentolibroamministratore']) {
    http_response_code(200);
  } else {
    throw new Exception('Invalid data');
  }
} catch (Exception $e) {
  http_response_code(400);
  file_put_contents('php://stderr', print_r($e, TRUE));
  echo 'Er: '.$e->getMessage();
}
echo true;
?>