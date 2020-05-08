CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER 'wp_user'@'localhost' IDENTIFIED BY 'pw';
CREATE USER 'superuser'@'localhost' IDENTIFIED BY 'pw';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_user'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'superuser'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;