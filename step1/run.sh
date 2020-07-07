# Scipt à faire tourner une fois Debian correctement installé

# Ajout du user au groupe root (si c'est déjà le cas, commenter cette étape)
echo "ATTENTION, TENTATIVE DE PASSAGE EN MODE ROOT"
su # Connexion à root
sudo adduser $USER root
exit # Déconnexion de root

# Installation Apache2
sudo apt update
sudo apt upgrade
sudo apt dist-upgrade
sudo apt install apache2

# Modification de la page d'accueil du port 80
sudo cp src/etc/apache2/mods-available/dir.conf /etc/apache2/mods-available/dir.conf # Ajout du fichier test.html dans la liste des index à utiliser par Apache
sudo cp src/var/www/html/test.html /var/www/html/test.html # Ajout de la nouvelle page d'accueil dans le DocumentRoot du site par defaut
sudo systemctl reload apache2

# Ajout d'un site sur le port 621
sudo cp src/etc/apache2/ports.conf /etc/apache2/ports.conf # Ajoute l'écoute au port 621
sudo cp src/etc/apache2/sites-available/lostgems.conf /etc/apache2/sites-available/lostgems.conf # Ajout d'un nouveau vhost pour ce site
sudo a2ensite lostgems.conf # Activation du nouveau vhost
sudo cp src/var/www/local /var/www/local -r # Ajout des ressources du nouveau site (pour faire un truc jouli)
sudo systemctl reload apache2

# Normalement en tapant l'IP de la machine dans un navigateur depuis le réseau local on voit test.html
# En tapant IP:621 on voit le site installé sur le port 621

