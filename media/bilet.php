<?php
    $ID_kl = $_POST['klient'];
    $ID_l = $_POST['linia'];
    $ID_b = $_POST['bilet'];

    $link = @mysqli_connect("localhost","root","","ztm");
    $into = 'INSERT INTO `przejazdy` VALUES (NULL, "'.$ID_kl.'", "'.$ID_b.'", "'.$ID_l.'");';
    $wsad = @mysqli_query($link, $into) or die(mysqli_error($wsad));
    mysqli_close($link);

    header("Location: ../index.php?pages=formularz-biletowy");
?>