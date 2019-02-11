$port= new-Object System.IO.Ports.SerialPort COM6,9600,none,8,1
$port.open()
[int]$runs = Read-Host "Please enter number of experiments " 
[int]$delay = Read-Host "Please enter delay (seconds) " 
[string]$filename = Read-Host "please enter a filename "
[String]$filelocation = "C:\Users\Administrator\Documents\Polarimeter Data\"
[String]$outputfile = $filelocation + $filename + ".CSV"
[string[]]$data
$port.WriteLine("start")
Start-Sleep -s 1
$port.ReadExisting()
Start-Sleep -s 20
For ($i=0; $i -le $runs; $i++){ 
    $port.WriteLine("getdata")
    #Start-Sleep -m 1000
    $currentdata = $port.ReadExisting()
    $timestamp = Get-Date
    $data += $currentdata + ";" #+ $timestamp
    Out-File -FilePath $outputfile -Encoding ascii -InputObject $data
    $port.WriteLine("start")
    $port.ReadExisting()
    Start-Sleep -s $delay
    }
$port.Close()

[string]$filename = Read-Host "Press Enter to end"