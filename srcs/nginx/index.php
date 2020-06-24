<?php
	$user = getenv('USER');
	$password = getenv('PASSWORD');
	$minikube_ip = getenv('MINIKUBE_IP');
	$nginx_service_port_ssh = getenv('NGINX_SSH_SERVICE_PORT_SSH');
	$ftps_service_port_ftps = getenv('FTPS_SERVICE_PORT_FTPS');

?>

<!DOCTYPE HTML>
<html>
	<head>
		<title>ft_services by julnolle</title>
		<style>
			body, p {padding-left: 20px;}
			h1,h2,h3   {margin-bottom: 5px;}
			p   {margin-bottom: 0px;}
		</style>
	</head>
	<body>
		<h1>Welcome to my ft_services</h1>
		<h2>IP: <?= $minikube_ip ?></h2>
		<div class="sites-avaibles">
			<h3>From their you can acces to the following services:</h3>
			<p><strong>nginx</strong>: <a href="http://<?= $minikube_ip ?>:80">http://<?= $minikube_ip ?>:80</a></p>
			<p><strong>nginx - https</strong>: <a href="https://<?= $minikube_ip ?>:443">https://<?= $minikube_ip ?>:443</a></p>
			<p><strong>wordpress</strong>: <a href="http://<?= $minikube_ip ?>:5050">http://<?= $minikube_ip ?>:5050</a></br>
			user: julien - password: 'pw'</p>
			<p><strong>phpmyadmin</strong>: <a href="http://<?= $minikube_ip ?>:5000">http://<?= $minikube_ip ?>:5000</a></br>
			superuser: superuser - password: 'pw' (all privleges on all databases)</br>
			admin: wp_admin - password: 'pw' (all privleges on 'wordpress' database)</br>
			user1: wp_user - password: 'pw' (restricted privileges)</br>
			user2: wp_user2 - password: 'pw' (restricted privileges)
			</p>
			<p><strong>grafana</strong>: <a href="http://<?= $minikube_ip ?>:3000">http://<?= $minikube_ip ?>:3000</a></p>
		</div>
		<div class="others">
			<h3>FTPS & SSH</h3>
			<p><strong>nginx - ssh</strong>: ssh <?= $user ?>@<?= $minikube_ip ?> -p <?= $nginx_service_port_ssh ?> - password: '<?= $password ?>'</p>
			<p><strong>Ftp anonymous</strong>: <a href="ftp://<?= $minikube_ip ?>:<?= $ftps_service_port_ftps ?>">ftp://<?= $minikube_ip ?>:<?= $ftps_service_port_ftps ?></a></p>
			<p><strong>Ftp by fillezilla</strong>: open filezilla and connect to <?= $minikube_ip ?> on port <?= $ftps_service_port_ftps ?></br>
			Credentials: <?= $user ?>:<?= $password ?></p>
		</div>
		<div class="useful-commands">
			<h3>Useful commands</h3>
			<p><strong>Dashboard</strong>:</br>
			minikube dashboard</p>
			<p><strong>launch a sh on a pod:</strong></br>
			kubectl exec -it [pod-name] -- /bin/sh</p>
		</div>
	</body>
</html>
