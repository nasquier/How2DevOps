apt update
apt install curl

curl -fsSL https://get.docker.com | sh
sudo chmod 666 /var/run/docker.sock
systemctl start docker
sudo docker run -dit --name how2devops -p 8080:80 -v /var/www/html/:/usr/local/apache2/htdocs/ httpd:2.4
# -dit = detached in backgroung + interactive with stdin + pseudo tty