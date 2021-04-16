<!DOCTYPE html>
<html lang="en">
<head>

    <link rel="stylesheet" href="Style.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Indie+Flower&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css"rel="nofollow" integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div class="statusBar">
        <button class="btn btn-dark" type="button">Mappa Biblioteche</button>
        <div class="dropdown">
            <button class="btn btn-dark dimLeft">Accedi</button>
            <div class="dropdown-content">
                <label class="margin-bottom-5">Utente: </label><br>
                <input class="margin-bottom-5" type="text" placeholder="utente"><br>
                <label class="margin-bottom-5">Password: </label><br>
                <input class="margin-bottom-5" type="password" placeholder="password"><br><br>
                <input class="margin-bottom-5" type="submit" value="E Ora?"><br>
                <br>
                <a href="#">Non sei ancora registrato?</a>
            </div>
        </div>
    </div>
    <div class="flex-container logo colorContainerHeader">
        <a href="index.html"><img  id="logo" src="Logo.png" alt="Logo"></a>
    </div>

    <div class="searchBar">

        <div class="flex-container">
            <input type="text" class="form-control" placeholder="Tutte le informazioni">
            
            <input type="checkbox" class="btn-check" id="btn-check-1-outlined" checked autocomplete="off">
            <label class="btn btn-outline-secondary dimLeft2" for="btn-check-1-outlined">Biblioteche</label>
            
            <a href="Page2.html"><button type="button" class="btn btn-secondary dimLeft"><i class="fa fa-search"></i></button></a>
        </div>
        <br>
        <div class="flex-container colorContainerSearch">
            <input type="checkbox" class="btn-check" id="btn-check-2-outlined" autocomplete="off">
            <label class="btn btn-outline-dark" for="btn-check-2-outlined"><i class="fa fa-user-o"></i> Posto lettura</label>

            <input type="checkbox" class="btn-check" id="btn-check-3-outlined" autocomplete="off">
            <label class="btn btn-outline-primary dimLeft" for="btn-check-3-outlined"><i class="fa fa-archive"></i> Biblioteca</label>

            <input type="checkbox" class="btn-check" id="btn-check-4-outlined" autocomplete="off">
            <label class="btn btn-outline-danger dimLeft" for="btn-check-4-outlined"><i class="fa fa-book"></i> Libro cartaceo</label>

            <input type="checkbox" class="btn-check" id="btn-check-5-outlined" autocomplete="off">
            <label class="btn btn-outline-success dimLeft" for="btn-check-5-outlined"><i class="fa fa-file-pdf-o"></i> Ebook</label>
        </div>
    </div>

{{content}}

</body>
</html>