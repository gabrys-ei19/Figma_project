<?php
	
	include("config.php");
	
	(empty($_GET['pages'])) ? $url = home : $url = $_GET['pages'];	
	
	$file = "pages/".$url.".php";
		
	include("modules/header.html");
	
	if(file_exists($file)) {
		include($file);
	} else {
		include("pages/error.php");
	}
	
	include("modules/footer.html");
?>