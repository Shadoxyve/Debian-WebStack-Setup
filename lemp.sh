#! /bin/sh
echo "Checking if the user is sudo......"
if [ "$EUID" -ne 0 ]
  then echo; echo "Please run as root"
  echo
  exit
fi
clear 
echo "Select the Stack which should be Installed:"
echo
echo "1.LEMP - Nginx,MySQL,PHP"
echo "2.LAMP - Apache,MySQL,PHP"
echo "3.MEAN - MongoDB,Express,Angular,Node.js"
echo
printf 'Enter the Number : ' ;read -r stack

if [[ $stack == "1" ]] ; then

	echo "Installing Nginx"
apt install nginx -y
	echo "Installing MariaDB"
apt install mariadb-server -y
	echo "Installing PHP"
apt install php-fpm php-mysql -y
	echo "Staring MariaDB Setup"
mysql_secure_installation
clear
	echo "----------x-x-x-LEMP Installation Is Complete-x-x-x----------"

elif [[ $stack == "2" ]] ; then
        echo "Installing Apache"
apt install apache2 -y
	echo "Installing MariaDB"
apt install mariadb-server -y
        echo "Installing PHP"   
apt install php-fpm libapache2-mod-php php-mysql -y
        echo "Staring MariaDB Setup"
mysql_secure_installation
clear
	echo "---------x-x-x-LAMP Installation Is Complete-x-x-x----------"
elif [[ $stack == "3" ]] ; then
        echo "Installing Dependencies"
apt install dirmngr gnupg apt-transport-https software-properties-common ca-certificates curl gcc g++ make git python2 -y
        echo "Installing Node.js"
curl -sL https://deb.nodesource.com/setup_14.x | bash -
apt-get install nodejs -y
	echo "Installing Yarn and Npm Dependencies"
npm install –g yarn
npm install –g gulp
npm install -g grunt-cli
	echo "Installing MongoDB"
curl -fsSL https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add -
add-apt-repository 'deb https://repo.mongodb.org/apt/debian buster/mongodb-org/4.2 main'
apt update -y
apt install mongodb-org -y
systemctl start mongod.service
systemctl enable mongod.service
	echo "Install Mean.js"
git clone https://github.com/meanjs/mean.git meanjs
cd meanjs/
npm start
clear
	echo "---------x-x-x-MEAN Installation Is Complete-x-x-x----------"
echo
	echo "Mean.js is Up and Running at port 3000"

else
	echo "Invalid Input, Exiting the Installation......" ; exit
fi

