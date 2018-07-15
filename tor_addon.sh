                                          #/bin/bash
cd ~
echo "************************************************************************************"
echo "*                        XUEZ WALLET TOR AND UPDATE SCRIPT                         *"
echo "************************************************************************************"
echo "Do you want to install all needed updates and firewall settings? [y/n]"
read DOSETUP
	if [[ $DOSETUP =~ "y" ]] || [[$DOSETUP =~ "Y" ]] ; then
	sudo apt-get update
	sudo apt-get -y upgrade
	sudo apt-get -y dist-upgrade
	
	sudo apt-get install -y ufw
	sudo ufw allow ssh/tcp
	sudo ufw limit ssh/tcp
	sudo ufw logging on
	sudo ufw allow 22
	echo "y" | sudo ufw enable
	sudo ufw status
  
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

fi
./xuez-cli stop
pkill -9 xuezd
rm ~/xuez-cli
rm ~/xuezd
rm ~/xuez-linux-cli.tgz
rm ~/xuez-tx
echo ""
wget https://github.com/XUEZ/xuez/releases/download/1.0.1.10/xuez-linux-cli-10110.tgz
echo ""
echo ""
tar -xvzf xuez-linux-cli-10110.tgz
rm xuez-linux-cli-10110.tgz
./xuezd -resync
echo "****************************************************************************"
echo "*                        UPDATE COMPLETE                                   *"
echo "****************************************************************************"
