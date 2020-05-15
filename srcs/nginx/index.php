<?php
	$minikube_ip = getenv('MINIKUBE_IP');
	$nginx_service_port_ssh = getenv('NGINX_SERVICE_PORT_SSH');

?>

<!DOCTYPE HTML>
<html>
	<head>
		<title>ft_services</title>
	</head>
	<body>
		<h1>ft_services</h1> on <?= $minikube_ip ?>
		</br>
		<div class="sites-avaibles">
			<h3>sites availables</h3>
			nginx: <a href="http://<?= $minikube_ip ?>:80">http://<?= $minikube_ip ?>:80</a></br>
			or <a href="https://<?= $minikube_ip ?>:443">https://<?= $minikube_ip ?>:443</a></br>
			wordpress: <a href="http://<?= $minikube_ip ?>:5050">http://<?= $minikube_ip ?>:5050</a></br>
			phpmyadmin: <a href="http://<?= $minikube_ip ?>:5000">http://<?= $minikube_ip ?>:5000</a></br>
			grafana: <a href="http://<?= $minikube_ip ?>:3000">http://<?= $minikube_ip ?>:3000</a></br>
		</div>
		<div class="others">
			<h3>others</h3>
			nginx - ssh: ssh __SSH_USERNAME__@<?= $minikube_ip ?> -p <?= $nginx_service_port_ssh ?></br>
			password is __SSH_PASSWORD__</br>
			</br>
			ftps: open filezilla and connect to <?= $minikube_ip ?> on port 21</br>
			__FTPS_USERNAME__:__FTPS_PASSWORD__ </br>
		</div>
		<div class="useful-commands">
			<h3>useful commands</h3>
			dashboard:</br>
			minikube dashboard</br>
			</br>
			launch a command on a pod:</br>
			kubectl exec -i $(kubectl get pods | grep pod-name | cut -d" " -f1) -- command</br>
		</div>
	</body>
</html>
