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
sudo git clone https://github.com/absolute-community/absolute.git /root/tempABS

cd /root/tempABS
chmod 777 autogen.sh
chmod -R 755 /root/tempABS
./autogen.sh
./configure
chmod +x share/genbuild.sh
sudo make
sudo make install

mkdir /root/absolute
mkdir -p /root/.absolutecore

cp /root/tempABS/src/absoluted /root/absolute
cp /root/tempABS/src/absolute-cli /root/absolute

chmod -R 777 /root/absolute
chmod -R 777 /root/.absolutecore

sudo apt-get install -y pwgen

echo ""
echo "Configure your masternodes now!"
echo "Type the IP of this server, followed by [ENTER]:"
IP=INPUT_HERE_IP_VPS
echo $IP

echo ""
echo "Enter masternode private key for node $ALIAS"
PRIVKEY=INPUT_HERE_GENKEY_OF_YOUR_MASTERNODE

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

echo "addnode=139.99.98.145:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=51.255.174.238:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=54.37.14.240:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=164.132.195.79:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=208.167.248.187:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=45.77.146.105:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=45.77.221.206:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=45.76.171.105:18888" >> $CONF_DIR/$CONF_FILE

echo "addnode=54.37.17.154:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=54.36.162.69:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=151.80.142.66:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=54.36.162.72:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=91.134.137.168:18888" >> $CONF_DIR/$CONF_FILE
echo "addnode=54.36.162.71:18888" >> $CONF_DIR/$CONF_FILE

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