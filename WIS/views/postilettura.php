<div class="listarisultati-corpo">
    <?php
    foreach ($postilettura as $biblioteca=>$posti) {
        $name = $biblioteca;
        $linkname = str_replace(' ', '', $name);

        echo "<div class='card-risultato'>
                  <h3 class='titolo-lista-risultati'><a href='/biblioteche?n=$linkname'>$name</a></h3>
                  <details>
                        <summary class='noBlueLine'>Lista posti lettura</summary>";
                        if (isset($user)) echo "
                        <div class='registrazione-form'>
                            <input class='registrazione-datepicker' type='text' placeholder='yy-mm-dd'>
                            <input class='registrazione-timepicker' type='text' placeholder='hh:mm'>
                            <button class='registrazione-post post-search-btn has-hover' id='registrazione-btn'>Prenota posto lettura</button>
                        </div> ";
                        echo"
                        <div class='dettagli-lista-posti'>
                  ";
        foreach ($posti as $key=>$posto){
            $presacorr = $posto['presacorr'];
            $presaeth = $posto['presaeth'];
                echo "<div class='card-posto'>
                        <h5>Posto $key</h5>";
                        echo $presacorr ? "<p><i class='fas fa-plug disponibile'></i> Presa Corrente</p>" : "<p> <i class='fas fa-plug non-disponibile'></i> Presa Corrente</p>";
                        echo $presaeth ? "<p><i class='fas fa-ethernet disponibile'></i> Ethernet</p>" : "<p> <i class='fas fa-ethernet non-disponibile'></i> Ethernet</p>";
                        echo "
                      </div>";
        }
        echo "
                      </div>
                 </details>
              </div>";
    }
    ?>
</div>
<script src="js/SearchPostiLettura.js"></script>