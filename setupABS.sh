#!/bin/bash
sudo touch /var/swap.img
sudo chmod 600 /var/swap.img
sudo dd if=/dev/zero of=/var/swap.img bs=1048k count=4000
mkswap /var/swap.img
sudo swapon /var/swap.img
sudo echo "/var/swap.img none swap sw 0 0" >> /etc/fstab
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get install nano htop git -y
sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils software-properties-common libgmp3-dev  -y
sudo apt-get install libboost-all-dev -y
sudo add-apt-repository ppa:bitcoin/bitcoin -y
sudo apt-get update -y
sudo apt-get install libdb4.8-dev libdb4.8++-dev -y
sudo apt-get install libminiupnpc-dev -y

mkdir /root/tempABS
cd /root/tempABS
sudo git clone https://github.com/absolute-community/absolute.git

cd /root/tempABS/absolute
chmod 777 autogen.sh
chmod -R 755 /root/tempABS/absolute
./autogen.sh
./configure
chmod +x share/genbuild.sh
sudo make
sudo make install

mkdir /root/absolute
mkdir -p /root/.absolutecore

cd /root/tempABS
wget https://github.com/absolute-community/absolute/releases/download/12.2.3/absolute_12.2.3_linux.tar.gz
tar -xzf absolute*.tar.gz
sleep 3

cd /root/tempABS/absolute_12.2.3_linux
cp /root/tempABS/absolute_12.2.3_linux/absoluted /root/absolute
cp /root/tempABS/absolute_12.2.3_linux/absolute-cli /root/absolute

chmod -R 777 /root/absolute
chmod -R 777 /root/.absolutecore

sudo apt-get install -y pwgen

echo ""
echo "Configure your masternodes now!"
echo "Type the IP of this server, followed by [ENTER]:"
IP=107.191.50.91
echo $IP

echo ""
echo "Enter masternode private key for node $ALIAS"
PRIVKEY=4ha7YB5fz3hPsQXkMcC28nHKzSGV4URu5hk7xzAca8wNH6G3RB7

CONF_DIR=/root/.absolutecore
CONF_FILE=absolute.conf
PORT=18888


echo "rpcuser=userAbsolute"`shuf -i 100000-10000000 -n 1` >> $CONF_DIR/$CONF_FILE
echo "rpcpassword=passAbsolute"`shuf -i 100000-10000000 -n 1` >> $CONF_DIR/$CONF_FILE
echo "rpcallowip=127.0.0.1" >> $CONF_DIR/$CONF_FILE
echo "rpcport=18889" >> $CONF_DIR/$CONF_FILE
echo "listen=1" >> $CONF_DIR/$CONF_FILE
echo "server=1" >> $CONF_DIR/$CONF_FILE
echo "daemon=1" >> $CONF_DIR/$CONF_FILE
echo "logtimestamps=1" >> $CONF_DIR/$CONF_FILE
echo "maxconnections=256" >> $CONF_DIR/$CONF_FILE
echo "masternode=1" >> $CONF_DIR/$CONF_FILE
echo "externalip=$IP:$PORT" >> $CONF_DIR/$CONF_FILE
echo "" >> $CONF_DIR/$CONF_FILE

echo "addnode=139.99.202.1:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=139.99.41.242:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=139.99.41.241:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=51.255.174.238:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=54.37.14.240:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=164.132.195.79:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=151.80.233.116:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=139.99.96.203:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=139.99.40.157:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=139.99.41.35:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=139.99.41.198:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=139.99.44.0:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=139.99.97.225:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=139.99.105.69:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=139.99.99.113:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=139.99.99.108:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=139.99.99.121:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=139.99.106.75:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=139.99.44.75:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=139.99.44.76:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=139.99.44.77:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=139.99.199.250:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=81.169.175.9:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=45.76.8.7:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=51.38.231.64:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=108.160.133.89:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=168.215.75.10:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=168.215.75.11:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=168.215.75.12:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=168.215.75.13:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=18.217.247.159:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=35.237.49.54:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=80.211.6.67:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=207.246.115.131:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=45.32.60.114:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=198.13.57.155:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=207.148.94.186:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=80.240.16.94:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=207.246.115.131:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=104.238.160.224:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=108.61.119.196:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=140.82.7.207:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=144.202.116.48:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=80.211.147.188:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=80.211.147.188:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=80.211.147.9:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=80.211.98.191:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=80.211.98.40:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=80.211.98.107:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=80.211.97.84:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=45.32.173.41:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=45.77.165.217:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=23.101.229.207:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=23.101.228.48:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=104.196.41.192:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=136.243.185.11:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=108.61.128.54:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=140.82.46.194:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=185.213.211.238:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=80.211.55.57:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=80.211.45.84:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=88.5.209.230:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=94.177.190.193:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=136.243.185.21:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=136.243.185.17:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=80.211.65.213:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=109.71.215.31:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=95.179.161.152:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=207.148.68.207:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=51.38.112.247:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=80.211.90.131:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=212.237.21.125:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=80.211.81.203:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=80.211.86.246:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=149.28.119.198:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=149.28.229.155:18888" >> $CONF_DIR/$CONF_FILE8
echo "addnode=149.28.104.170:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=45.77.165.217:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=80.211.86.246:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=51.38.234.233:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=54.36.146.89:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=54.37.180.25:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=54.37.180.26:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=144.202.2.200:18888" >> $CONF_DIR/$CONF_FILE

echo "" >> $CONF_DIR/$CONF_FILE
echo "port=$PORT" >> $CONF_DIR/$CONF_FILE
echo "masternodeaddress=$IP:$PORT" >> $CONF_DIR/$CONF_FILE
echo "masternodeprivkey=$PRIVKEY" >> $CONF_DIR/$CONF_FILE
sudo ufw allow $PORT/tcp

absoluted -daemon
sleep 3

cd /root/.absolutecore
sudo apt-get install -y git python-virtualenv
sudo git clone https://github.com/absolute-community/sentinel.git
cd sentinel
sudo apt-get install -y virtualenv
virtualenv venv
venv/bin/pip install -r requirements.txt
echo "absolute_conf=/root/.absolutecore/absolute.conf" >> /root/.absolutecore/sentinel/sentinel.conf
crontab -l > tempcron
echo "* * * * * cd /root/.absolutecore/sentinel && ./venv/bin/python bin/sentinel.py 2>&1 >> sentinel-cron.log" >> tempcron
crontab tempcron
rm tempcron
echo "Job completed successfully"
