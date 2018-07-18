<p align="center">
  <img src="https://pbs.twimg.com/media/DiLeYT2W4AQh7zA.png" width="250"/>
</p>

# <h>  VPS Masternode Setup script. </h>

To run the script simply type the following commands into your VPS terminal. 
 
`wget https://github.com/johnlito123/masternode_script/releases/download/1.5/XuezUpdate.sh && chmod 755 XuezUpdate.sh && ./XuezUpdate.sh`

<h1> Masternode Basic Requierments </h1>

- 1,000 XUEZ

- Main Computer with XUEZ wallet installed

- Masternode Server (Invite Link)

- Unique IP address for EACH masternode

<h1> Local Wallet Procedure </h1>

Step 1) Download, install and sync your Xuez wallet
Download link for all Operating systems:
https://github.com/XUEZ/XUEZ/releases  

Step 2) Using your main wallet, enter the debug console and type the following command:

- "masternode genkey"

- Please save this on a Notepad

Step 3) Using your main wallet, enter the debug console and type the following command:

- "getaccountaddress INSERT_MASTERNODE_NAME"

- Please save this on a Notepad

Step 4) Send 1,000 XUEZ to Step 3 address.

Step 5)  Using your main wallet, wait for 15 confirmations, and then enter the debug console and type the following command:

- "masternode outputs"
- Please save this on a Notepad 

Step 6) Locate your masternode.conf and add the following line: 

<INSERT_CHOOSEN_MASTERNODE_NAME> <Unique IP address>:41798 <MASTERNODE_GENKEY> <MASTERNODE_OUTPUT> <NUMBER_AFTER_MASTERNODE_OUTPUT_1_OR_0>

Note: Substitute it with your own values and without the “<>”s

Example:
MN1 31.11.135.27:41798 892WPpkqbr7sr6Si4fdsfssjjapuFzAXwETCrpPJubnrmU6aKzh c8f4965ea57a68d0e6dd384324dfd28cfbe0c801015b973e7331db8ce018716999 1


<h2> Run and follow the instructions on the script </h2> 
