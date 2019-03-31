# need to convert from QAD

$User = Read-Host "Enter user for lookup"
Get-QADUser $User | Format-Table lastlogon,name