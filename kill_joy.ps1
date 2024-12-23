$processFound = Get-Process -Name joytokey -ErrorAction SilentlyContinue

if ($processFound) {
    Stop-Process -Name joytokey -Force
    Write-Host "JoyToKey process was found and has been terminated."
}
else {
    Write-Host "JoyToKey process was not found."
    Write-Host "Starting JoyToKey..."
    Start-Process "C:\\Users\\Administrator\\Documents\\JoyToKey\\joytokey.exe"
}

