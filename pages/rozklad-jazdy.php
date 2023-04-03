<div id=container>
<aside>
    <?php
        $add = 'media/img/add/add'.rand(1,3).'.jpg';
        echo '<img class="add" src="'.$add.'" alt="Logo ZTM" />';
    ?>
</aside>
<main>
    <?php
        echo 'Linie Autobusów:<br>';
        $zapytanie = 'select * from linie';
        $wynik = mysqli_query($link, $zapytanie);
        foreach($wynik as $wiersz){
            echo ('Numer lini: '.$wiersz['numer_l']);
            $zapytanie = 'select * from trasy where ID_t in (select '.$wiersz['ID_trasy'].' from linie)';
            $wyniki = mysqli_query($link, $zapytanie);
            foreach ($wyniki as $wiersze){
                echo (' Przystanek początkowy: '.$wiersze['p_poczatkowy'].', Przystanek Końcowy: '.$wiersze['p_koncowy']);
            };
            echo '<br>';
        };

        echo '<br><br>';

        echo 'Rodzaje biletów:<br>';
        $zapytanie = 'select * from bilety';
        $wynik = mysqli_query($link, $zapytanie);
        foreach($wynik as $wiersz){
            echo ('Czas trwania biletu: '.$wiersz['czas'].', Cena za bilet: '.$wiersz['cena'].'zł, Ulga - ');
            if ($wiersz['ulga'] == 1) {
                echo 'tak<br>';
            } else {
                echo 'nie<br>';
            };
        };
    ?>
</main>
</div>