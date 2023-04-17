<div id=container>
<aside>
    <?php
        $add = 'media/img/add/add'.rand(1,3).'.jpg';
        echo '<img class="add" src="'.$add.'" alt="Logo ZTM" />';
    ?>
</aside>
<main>
    <?php
        $zapytanie = 'SELECT * FROM przejazdy';
        $wynik = mysqli_query($link, $zapytanie);
        foreach($wynik as $wiersz){
            echo $wiersz['ID_p'].'. ';
            $klienci = 'SELECT `imie`, `nazwisko` FROM klienci WHERE `ID_kl` = '.$wiersz['ID_klienta'].';';
            $klient = mysqli_query($link, $klienci);
            foreach($klient as $dane){
                echo $dane['imie'].' '.$dane['nazwisko'].', ';
            };
            $bileciki = 'SELECT `czas`, `ulga` FROM `bilety` WHERE `ID_b` = '.$wiersz['ID_biletu'].';';
            $bilecik = mysqli_query($link, $bileciki);
            foreach($bilecik as $daneb){
                if ($daneb['czas'] == '00:20:00') {
                    $bil = '20 minut';
                } else if ($daneb['czas'] == '00:40:00') {
                    $bil = '40 minut';
                } else if ($daneb['czas'] == '01:30:00') {
                    $bil = '90 minut';
                }

                if ($daneb['ulga'] == 1) {
                    $ulga = 'ulgowy';
                } else {
                    $ulga = 'normalny';
                }
                echo 'bilet: '.$bil.' '.$ulga.'<br>';
            };
            $linia = 'SELECT `numer_l`, `ID_trasy` FROM `linie` WHERE `ID_l` = '.$wiersz['ID_lini'].';';
            $linie = mysqli_query($link, $linia);
            foreach($linie as $bus){
                echo 'Numer lini: '.$bus['numer_l'].', ';
                $trasa = 'SELECT `p_poczatkowy`, `p_koncowy` FROM `trasy` WHERE `ID_t` = '.$bus['ID_trasy'].';';
                $trasy = mysqli_query($link, $trasa);
                foreach($trasy as $przystanki){
                    echo 'przystanek początkowy: '.$przystanki['p_poczatkowy'].', przystanek końcowy: '.$przystanki['p_koncowy'].'<br><br>';
                };
            };
        }; 
    ?>
</main>
</div>