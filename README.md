# Polarimeter_script for Anton Paar MCP 150 - Polarimeter

Requires an RS-232 connection from the back of the polarimeter to the computer in question

Sends "start" and "get data" commands to a polarimeter allows for setting number of experiments and time delay
between each reading. 

Defaults to COM6 and "C:\Users\Administrator\Documents\Polarimeter Data\" for the Port and CSV file Loc
respectively.

in order to change the default COM port the code on line 1 
1. $port= new-Object System.IO.Ports.SerialPort COM6,9600,none,8,1
should be changed from COM6 to the COM port your computer detects

similarly the user directory should be changed from 
C:\Users\Administrator\Documents\Polarimeter Data\
to your user directory, this can be found on line 6
6. [String]$filelocation = "C:\Users\Administrator\Documents\Polarimeter Data\"