#/bin/bash
echo ""
echo "................................................................................"
echo "......................................N0OKW....................................."
echo "....................................W0c'.,dX...................................."
echo "..................................WKo'.....:ON.................................."
echo ".................................Nx;........'lKW................................"
echo "...............................WO:............,xX..............................."
echo ".............................WKl'...............cOW............................."
echo "............WWWWWWWWWWWWWWWWWN0xxxxxxxxxxxxxxxxxxOXWWWWWWWWWWWWWWWWWW..........."
echo "............WWNNNNNNNNWWWWXOxxxxxxdddddddddddxxxdkKNNNNNNNNNNNNNNNWW............"
echo "..............WWNNNNNNWMW0l'....................;xXNNNNNNNNNNNNNWW.............."
echo "................WWNNNNWXd,.....................l0NNNNNNNNNNNNNWW................"
echo "...................WWNk::cccccccc:...........;xXNNNNNNNNNNNNWW.................."
echo "...................W0o,'xXNNNNNNNXx;.......'o0NNNNNNNNNNNX00N..................."
echo ".................WKo,..'oXNNNNNNNNNKd,....:kXNNNNNNNNNNX0o,,l0W................."
echo "................Nx;.....,lOXNNNNNNNNNOl::dKNNNNNNNNNNXOl'....;dX................"
echo "..............WOc'........,o0XNNNNNNNNXXXNNNNNNNNNNXOl'.......':kN.............."
echo "............WKo,............,o0XNNNNNNNNNNNNNNNNNXOl,...........'l0W............"
echo "...........Xx;................;dKNNNNNNNNNNNNNNXOl,...............,dXW.........."
echo ".........Nk:'...................:kNNNNNNNNNNNNKo,...................;kN........."
echo "........Nx,....................,o0NNNNNNNNNNNNKd,....................'xW........"
echo "........WKl'..................:xKXXXXXXXXXXXXXXXOc'.................,dXW........"
echo "..........Nk;...............'lk0000000OkkO0000000Od:'.............'c0W.........."
echo "...........WKl'............:xO000000Oxc,,:dO0000000ko;'.''.''..'';xX............"
echo ".............Nk;.........,oO000000Oxc'....':xO000000Okl,''''.'''l0W............."
echo "..............WKl'......:dkOO000Oxc'........,cxO000000Od;'''.';xX..............."
echo "................Nk;...,lxkkkkkkdc'............,cxO00000k:''''c0W................"
echo ".................WKl,:dkkkkkxo;................',lxOOOOx;;llxX.................."
echo "..................WKkxkkkkxo;....................',;:::;';x0XW.................."
echo ".................WKOkkkkxo;...........................'';d000KN................."
echo "...............WN0kkkkkOo'............................'c0NK0000XW..............."
echo "..............NKOkkkkk0KOl;,,,,,,,,,,,,,,,,,,,,,,,,;;:o0NNK00000KNW............."
echo ".............N0OOkkkOOOOOOkkxddddddddddddddddddddddxkkOO00000000KKNW............"
echo "............WWNNNNNNNNNNNNNXx:'''''''''''''''''''':kXNNNNNNWWWWWWWW............."
echo "............................WO:..................:OW............................"
echo ".............................MXo'..............'oX.............................."
echo "...............................WO:............:OW..............................."
echo ".................................Xo'........'oX................................."
echo "..................................WO:......;OW.................................."
echo "....................................Xo'..'oK...................................."
echo ".....................................W0ddON....................................."
echo ""
echo "****************************************************************************"
echo "* This script will install and configure your XUEZ Coin masternodes.       *"
echo "*                 										                 *"
echo "*    If you have any issues please ask for help on the XUEZ discord.       *"
echo "*                      https://discord.gg/QWcK5Yk                          *"
echo "*                        https://xuezcoin.com/                             *"
echo "****************************************************************************"
echo ""
echo ""
echo ""

sudo su -c "echo 'deb http://deb.torproject.org/torproject.org '$(lsb_release -c | cut -f2)' main' > /etc/apt/sources.list.d/torproject.list"
	gpg --keyserver keys.gnupg.net --recv A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89
	gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -
	sudo apt-get update
	sudo apt-get install tor deb.torproject.org-keyring
	sudo usermod -a -G debian-tor $(whoami)

	sudo sed -i 's/#ControlPort 9051/ControlPort 9051/g' /etc/tor/torrc
	sudo sed -i 's/#CookieAuthentication 1/CookieAuthentication 1/g' /etc/tor/torrc 
	sudo su -c "echo 'CookieAuthFileGroupReadable 1' >> /etc/tor/torrc"
	sudo su -c "echo 'LongLivedPorts 9033' >> /etc/tor/torrc"
	sudo systemctl restart tor.service

	
	sudo apt-get update
	sudo apt-get -y upgrade
	sudo apt-get -y dist-upgrade

echo "Do you want to install all needed dependencies (no if you did it before)? [y/n]"
read DOSETUP

if [[ $DOSETUP =~ "y" ]] ; then
  sudo apt-get update
  sudo apt-get -y upgrade
  sudo apt-get -y dist-upgrade
  sudo apt-get install -y nano htop git
  sudo apt-get install -y software-properties-common
  sudo apt-get install -y build-essential libtool autotools-dev pkg-config libssl-dev
  sudo apt-get install -y libboost-all-dev
  sudo apt-get install -y libboost-system-dev
  sudo apt-get install -y libzmq3-dev
  sudo apt-get install -y libevent-dev
  sudo apt-get install -y libminiupnpc-dev
  sudo apt-get install -y autoconf
  sudo apt-get install -y automake unzip
  sudo add-apt-repository  -y  ppa:bitcoin/bitcoin
  sudo apt-get update
  sudo apt-get install -y libdb4.8-dev libdb4.8++-dev

  cd /var
  sudo touch swap.img
  sudo chmod 600 swap.img
  sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=2000
  sudo mkswap /var/swap.img
  sudo swapon /var/swap.img
  sudo free
  sudo echo "/var/swap.img none swap sw 0 0" >> /etc/fstab
  cd

  wget https://bitbucket.org/davembg/xuez-distribution-repo/downloads/xuez-linux-cli-10110.tgz 		
  tar -xvzf xuez-linux-cli-10110.tgz
  chmod -R 755 xuez-linux-cli-10110
  rm /usr/bin/xuez*
  mv ~/xuez* /usr/bin
  rm -r xuez-linux-cli-10110.tgz
  
  sudo apt-get install -y ufw
  sudo ufw allow ssh/tcp
  sudo ufw limit ssh/tcp
  sudo ufw logging on
  echo "y" | sudo ufw enable
  sudo ufw status
  
  mkdir -p ~/bin
  echo 'export PATH=~/bin:$PATH' > ~/.bash_aliases
  source ~/.bashrc
fi

## Setup conf
mkdir -p ~/bin


MNCOUNT=""
re='^[0-9]+$'
while ! [[ $MNCOUNT =~ $re ]] ; do
   echo ""
   echo "How many nodes do you want to create on this server?, followed by [ENTER]:"
   read MNCOUNT
done

for i in `seq 1 1 $MNCOUNT`; do
  echo ""
  echo "Enter alias for new node"
  read ALIAS

  echo ""
  echo "Enter port 41798 for node $ALIAS"
  read PORT

  echo ""
  echo "Enter masternode private key for node $ALIAS"
  read PRIVKEY

  echo ""
  echo "Configure your masternodes now!"
  echo "Type the IP of this server, followed by [ENTER]:"
  read IP

  echo ""
  echo "Enter RPC Port eg. 4001/4002"
  read RPCPORT

  ALIAS=${ALIAS,,}
  CONF_DIR=~/.xuez_$ALIAS

  # Create scripts
  echo '#!/bin/bash' > ~/bin/xuezd_$ALIAS.sh
  echo "xuezd -daemon -conf=$CONF_DIR/xuez.conf -datadir=$CONF_DIR "'$*' >> ~/bin/xuezd_$ALIAS.sh
  echo '#!/bin/bash' > ~/bin/xuez-cli_$ALIAS.sh
  echo "xuez-cli -conf=$CONF_DIR/xuez.conf -datadir=$CONF_DIR "'$*' >> ~/bin/xuez-cli_$ALIAS.sh
  echo '#!/bin/bash' > ~/bin/xuez-tx_$ALIAS.sh
  echo "xuez-tx -conf=$CONF_DIR/xuez.conf -datadir=$CONF_DIR "'$*' >> ~/bin/xuez-tx_$ALIAS.sh
  chmod 755 ~/bin/xuez*.sh

  mkdir -p $CONF_DIR
  echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> xuez.conf_TEMP
  echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> xuez.conf_TEMP
  echo "rpcallowip=127.0.0.1" >> xuez.conf_TEMP
  echo "rpcport=$RPCPORT" >> xuez.conf_TEMP
  echo "listen=1" >> xuez.conf_TEMP
  echo "server=1" >> xuez.conf_TEMP
  echo "daemon=1" >> xuez.conf_TEMP
  echo "logtimestamps=1" >> xuez.conf_TEMP
  echo "maxconnections=64" >> xuez.conf_TEMP
  echo "masternode=1" >> xuez.conf_TEMP
  echo "" >> xuez.conf_TEMP

  echo "" >> xuez.conf_TEMP
  echo "port=$PORT" >> xuez.conf_TEMP
  echo "externalip=$IP" >> xuez.conf_TEMP
  echo "bind=$IP" >> xuez.conf_TEMP
  echo "masternodeaddr=$IP:$PORT" >> xuez.conf_TEMP
  echo "masternodeprivkey=$PRIVKEY" >> xuez.conf_TEMP
  sudo ufw allow $PORT/tcp

  mv xuez.conf_TEMP $CONF_DIR/xuez.conf

  sh ~/bin/xuezd_$ALIAS.sh -daemon -reindex
done