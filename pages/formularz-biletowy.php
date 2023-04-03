<div id=container>
<aside>
    <?php
        $add = 'media/img/add/add'.rand(1,3).'.jpg';
        echo '<img class="add" src="'.$add.'" alt="Logo ZTM" />';
    ?>
</aside>
<main>
    <fieldset>
        <legend>formularz Biletowy</legend>
        <form action="media/insert.php" method="post">
            <fieldset>
                <legend>Dodawanie pasażera do systemu:</legend>
                <label for="imie">
                    Imię: <input type="text" name="imie" id="imie">
                </label>
                <label for="nazwisko">
                    Nazwisko: <input type="text" name="nazwisko" id="nazwisko">
                </label>
                <label for="wiek">
                    Wiek: <input type="number" name="wiek" id="wiek">
                </label>
            </fieldset>
            <input type="submit" value="Zapisz">
        </form>

        <form action="media/bilet.php" method="post">
            <fieldset>
                <legend>Dane do biletu</legend>
                <label for="klient">
                    Nazwisko klienta: <select name="klient" id="kient">
                        <option value="NULL"></option>
                        <?php
                            $zapytanie = 'SELECT * FROM klienci';
                            $wynik = mysqli_query($link, $zapytanie);
                            foreach($wynik as $wiersz){
                                echo '<option value="'.$wiersz['ID_kl'].'">'.$wiersz['nazwisko'].'</option>';
                            };
                        ?>
                    </select>
                </label>
                <label for="linia">
                    Numer lini: <select name="linia" id="inia">
                        <option value="NULL"></option>
                        <?php
                            $zapytanie = 'SELECT * FROM linie';
                            $wynik = mysqli_query($link, $zapytanie);
                            foreach($wynik as $wiersz){
                                echo '<option value="'.$wiersz['ID_l'].'">'.$wiersz['numer_l'].'</option>';
                            };
                        ?>
                    </select>
                </label>
                <label for="bilet">
                    Bilet: <select name="bilet" id="bilet">
                        <option value="NULL"></option>
                        <?php
                            $zapytanie = 'SELECT * FROM bilety';
                            $wynik = mysqli_query($link, $zapytanie);
                            foreach($wynik as $wiersz){
                                if ($wiersz['czas'] == '00:20:00') {
                                    $bilet = '20 minut';
                                } else if ($wiersz['czas'] == '00:40:00') {
                                    $bilet = '40 minut';
                                } else if ($wiersz['czas'] == '01:30:00') {
                                    $bilet = '90 minut';
                                }

                                if ($wiersz['ulga'] == 1) {
                                    $ulga = 'ulgowy';
                                } else {
                                    $ulga = 'normalny';
                                }
                                echo '<option value="'.$wiersz['ID_b'].'">'.$bilet.' ('.$ulga.')</option>';
                            };
                        ?>
                    </select>
                </label>
            </fieldset>
            <input type="submit" value="Zamów">
            <br><br>
    </fieldset>
</main>
</div>