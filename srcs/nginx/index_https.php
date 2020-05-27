<?php
	$user = getenv('USER');
	$password = getenv('PASSWORD');
	$minikube_ip = getenv('MINIKUBE_IP');
	$nginx_service_port_ssh = getenv('NGINX_SSH_SERVICE_PORT_SSH');
	// $ftps_service_port_ftps = getenv('FTPS_SERVICE_PORT_FTPS');

?>

<!DOCTYPE HTML>
<html>
	<head>
		<title>ft_services on HTTPS</title>
	</head>
	<body>
		<h1>ft_services on HTTPS</h1>
		<h2>IP: <?= $minikube_ip ?></h2>
		<div class="sites-avaibles">
			<h3>sites availables</h3>
			<strong>nginx</strong>: <a href="https://<?= $minikube_ip ?>:80">https://<?= $minikube_ip ?>:80</a></br>
			<strong>or</strong> <a href="https://<?= $minikube_ip ?>:443">httpss://<?= $minikube_ip ?>:443</a></br>
			<strong>wordpress</strong>: <a href="https://<?= $minikube_ip ?>/wordpress/">https://<?= $minikube_ip ?>/wordpress/</a></br>
			<strong>phpmyadmin</strong>: <a href="https://<?= $minikube_ip ?>/phpmyadmin/">https://<?= $minikube_ip ?>/phpmyadmin/</a></br>
			<strong>grafana</strong>: <a href="https://<?= $minikube_ip ?>/grafana/">https://<?= $minikube_ip ?>/grafana/</a></br>
		</div>
		<div class="others">
			<h3>FTPS & SSH</h3>
			<strong>nginx - ssh</strong>: ssh <?= $user ?>@<?= $minikube_ip ?> -p <?= $nginx_service_port_ssh ?></br>
			password is <?= $password ?></br>
			</br>
			<strong>ftps</strong>: open filezilla and connect to <?= $minikube_ip ?> on port 30021</br>
			with credentials: <?= $user ?>:<?= $password ?> </br>
		</div>
		<div class="useful-commands">
			<h3>Useful commands</h3>
			<strong>Dashboard</strong>:</br>
			minikube dashboard</br>
			</br>
			<strong>launch a sh on a pod:</strong></br>
			kubectl exec -it [pod-name] -- /bin/sh</br>
		</div>
	</body>
</html>
