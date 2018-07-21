# Absolute - start masternode easy
With this script you can easily start the Absolute 0.12.2.3a masternode (https://absolutecoin.io/).

Steps:

1 - Generate a new address in your Absolute wallet.

2 - Transfer EXACTLY 2500 ABS to the newly generated address.
    Wait for confirmations of your collateral (2500 ABS) before running the next command!

3 - After the coin arrived at the masternode address you can generate the genkey and outputs in the debug console with the comands (masternode genkey, masternode outputs). save this data because you will need that bellow.

4 - Update the masternode file by the menu Tools - Open Masternode Configuration file, and edit the content including the data like this(mn1 IPVpsServer:port genkeyValue firstpartOutputValue outputnumber) Note: If you have not a VPS Server created until now, it's time, just create and copy the ip.

5 - Edit the script setupABS.sh including the ip and genkey generated for you masternode in the line where is wrote INPUT_HERE_IP_VPS and INPUT_HERE_GENKEY_OF_YOUR_MASTERNODE.

6 - Connect to the VPS Server by Putty.

7 - Copy the content of the script edited with your ip and genkey of your masternode and paste inside a file as shown below.
    7.1 - write: vi setupABS.sh 
    7.2 - press i (to edit the file) 
    7.3 - paste the content by pressing the right button of your mouse. 
    7.4 - press ESC (To skip of the edit of the file) 
    7.5 - write: :w (to save the changes in the file) 
    7.6 - write: :q (to quit the file VIM editor)

8 - Change the permition of the script by the command: chmod -R 755 setupABS.sh

9 - Execute the script by the command: ./setupABS.sh

10 - Wait for some minutes until get a final message "Job completed successfully"

11 - Check if the wallet is synchronized with the command "absolute-cli mnsync status" until get the status "Masternode sync finished"

12 - Go to your windows wallet in the tab Masternodes, (if its not showing this tab you have to enable it at the menu settings --> Option and selecting the option "Show masternode tab" in the wallet tab, click ok and restart the wallet) 
    12.1 - click over the line of your masternode with status missing and click in "Start alias", after that your masternode status will change to Enabled.

13 - Make a check if the masternode is running in the linux by the command "absolute-cli masternode status" The result should be the outputs information and the status should be "Masternode successfully started", you can close the connection with your VPS and let it work for you.

14 - In the windows wallet, wait until status: Enabled and so wait for the first reward.
