# Run this script with sudo once Debian have been installed

## Add user to sudo group. If it's already the case, skip this step.
# echo "CAREFUL, WE ARE GOING SU"
# su 
# adduser $USER root
# exit # logout as root

# apache2 installation 
apt update
apt upgrade
apt dist-upgrade
apt install apache2

# Modification of the home page for port 80
cp rootdir/etc/apache2/mods-available/dir.conf /etc/apache2/mods-available/dir.conf # Add test.html in the apache2 index list 
cp rootdir/var/www/html/test.html /var/www/html/test.html # Add new home page to the default site DocumentRoot 
systemctl reload apache2

# Add site on port 621
cp rootdir/etc/apache2/ports.conf /etc/apache2/ports.conf # Add listening on port 621
cp rootdir/etc/apache2/sites-available/lostgems.conf /etc/apache2/sites-available/lostgems.conf # Add a new vhost for port 621
a2ensite lostgems.conf # vhost activation
systemctl reload apache2

# Downloading the sources for the new site
wget https://www.github.com/nasquier/lostgems/archive/master.tar.gz
gunzip master.tar.gz
tar -xf master.tar
rm master.tar
mkdir /var/www/local/lostgems -p
mv lostgems-master/mainpage/* /var/www/local/lostgems
rm lostgems-master -r

