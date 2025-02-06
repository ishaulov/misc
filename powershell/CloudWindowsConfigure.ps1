New-NetFirewallRule -DisplayName "Allow ICMPv4-In" -Direction Inbound -Protocol ICMPv4 -Action Allow
Get-NetAdapter | Restart-NetAdapter

"Hello - $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" | Out-File -FilePath "C:\Users\Administrator\Documents\test_before.txt"
ipconfig | Out-File -FilePath "C:\Users\Administrator\Documents\ipconfig_output_before.txt"

Start-Sleep -Seconds 10
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-Command Start-Sleep -Seconds 10; Get-NetAdapter | Restart-NetAdapter"
$trigger = New-ScheduledTaskTrigger -AtStartup
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable
$principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest
Register-ScheduledTask -Action $action -Trigger $trigger -Settings $settings -Principal $principal -TaskName "RestartNetAdapters" -Description "Restart Net Adapter"

"Bye - $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" | Out-File -FilePath "C:\Users\Administrator\Documents\test_after.txt"
ipconfig | Out-File -FilePath "C:\Users\Administrator\Documents\ipconfig_output_before.txt"

Start-Sleep -Seconds 10
Restart-Computer -Force