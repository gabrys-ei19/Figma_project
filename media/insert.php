<?php
    $imie = $_POST['imie'];
    $nazwisko = $_POST['nazwisko'];
    $wiek = $_POST['wiek'];

    $link = @mysqli_connect("localhost","root","","ztm");
    $into = 'INSERT INTO `klienci` VALUES (NULL, "'.$imie.'", "'.$nazwisko.'", "'.$wiek.'");';
    $wsad = @mysqli_query($link, $into) or die(mysqli_error($wsad));
    mysqli_close($link);

    header("Location: ../index.php?pages=formularz-biletowy");
?>