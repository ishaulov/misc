Start-Sleep -Seconds 10
Get-NetAdapter | Restart-NetAdapter -Confirm:$false