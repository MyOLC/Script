PowerShell -NoL -Com Set-ExecutionPolicy Unrestricted -Force
Set Path = %PATH%;C:\Program Files\WindowsPowerShell\Scripts
Install-Module AutopilotOOBE -Force -Verbose
Install-Module OSD -Force -Verbose
$Params = @{
    AddNetFX3 = $true
    AddRSAT = $false
    RemoveAppx = "Solitaire"
    SetEdition = 'Enterprise'
    UpdateDrivers = $true
    UpdateWindows = $true
}
Start-OOBEDeploy @Params
