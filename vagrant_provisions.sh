# This script will execute in the VM after its creation
# apache2 installation 
apt update
apt upgrade
apt dist-upgrade
apt install -y apache2

# Copy of the configuration files in the VM rootdir
cp /vagrant_data/* / -r

# Add site on a different port 
a2ensite lostgems.conf # vhost activation
systemctl reload apache2

# Downloading the sources for the new site
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/nullgunzip
wget https://www.github.com/nasquier/lostgems/archive/master.tar.gz
tar -xf master.tar
rm master.tar
mkdir /var/www/local/lostgems -p
mv lostgems-master/* /var/www/local/lostgems
rm lostgems-master -r