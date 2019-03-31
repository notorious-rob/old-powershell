Write-Host "Please enter the path to the batch csv file"
$csvfile = Read-Host
$batch = Import-Csv $csvfile


Foreach ($user in $batch) {

$samaccount = Get-Mailbox -Identity $user.Identity | Select SamAccountName 

"$samaccount" | Out-File ".\RemoveFromEVGroup.txt" -Encoding ASCII -Append


}