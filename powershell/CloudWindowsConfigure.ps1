Start-Sleep -Seconds 30
"Hello! Date: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" | Out-File -FilePath "C:\Users\Administrator\Documents\date.txt"
New-NetFirewallRule -DisplayName "Allow ICMPv4-In" -Direction Inbound -Protocol ICMPv4 -Action Allow
Restart-Computer -Force