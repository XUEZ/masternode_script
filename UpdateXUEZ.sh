                                          #/bin/bash
cd ~
echo "****************************************************************************"
echo "*                        XUEZ WALLET UPDATE SCRIPT                         *"
echo "****************************************************************************"
./xuez-cli stop 
pkill -9 xuezd
rm xuezd 
rm xuez-cli 
rm xuez-tx 
wget https://github.com/XUEZ/xuez/releases/download/1.0.1.10/xuez-linux-cli-10110.tgz 
tar -xf xuez-linux-cli-10110.tgz 
rm xuez-linux-cli-10110.tgz 
./xuezd -daemon -reindex 
echo "****************************************************************************"
echo "*                        UPDATE COMPLETE                                   *"
echo "****************************************************************************"
