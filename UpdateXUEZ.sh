                                          #/bin/bash
cd ~
echo "****************************************************************************"
echo "*                        XUEZ WALLET UPDATE SCRIPT                         *"
echo "****************************************************************************"
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
./xuezd -daemon -reindex
echo "****************************************************************************"
echo "*                        UPDATE COMPLETE                                   *"
echo "****************************************************************************"
