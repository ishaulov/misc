# Время на инициализацию после запуска
Start-Sleep -Seconds 30

# Установка времени Екб (GMT +5) и запись даты в файл
Set-TimeZone -Id "Ekaterinburg Standard Time"
"Hello! Date: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" | Out-File -FilePath "C:\Users\$($env:USERNAME)\Documents\date.txt"

# Разрешение ICMPv4
New-NetFirewallRule -DisplayName "Allow ICMPv4-In" -Direction Inbound -Protocol ICMPv4 -Action Allow

# Перезапуск ПК
Restart-Computer -Force