<?php

	//główny plik startowy
	define("home","strona-glowna");
	
	$link = @mysqli_connect("localhost","root","","ztm");
	if (!$link){
		$polaczenie = "Błąd: ".mysqli_connect_error();
		echo '<script>console.log("'.$polaczenie.'")</script>';
	} else {
		$polaczenie = "Baza się podłączyła";
		echo '<script>console.log("'.$polaczenie.'")</script>';
	}
?>