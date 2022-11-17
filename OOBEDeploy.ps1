Write-Host -ForegroundColor Green "Create C:\Windows\System32\OOBETasks.CMD"
$OOBETasksCMD = @'
PowerShell -NoL -Com Set-ExecutionPolicy Unrestricted -Force
Set Path = %PATH%;C:\Program Files\WindowsPowerShell\Scripts
Start /Wait PowerShell -NoL -C Install-Module AutopilotOOBE -Force -Verbose
Start /Wait PowerShell -NoL -C Install-Module OSD -Force -Verbose
$Params = @{
    AddNetFX3 = $true
    AddRSAT = $false
    RemoveAppx = "Solitaire"
    SetEdition = 'Enterprise'
    UpdateDrivers = $true
    UpdateWindows = $true
}
Start /Wait PowerShell -NoL -C Start-OOBEDeploy @Params
Start /Wait PowerShell -NoL -C Restart-Computer -Force
'@
$OOBETasksCMD | Out-File -FilePath 'C:\Windows\System32\OOBETasks.CMD' -Encoding ascii -Force

