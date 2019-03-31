import-module activedirectory

Write-Host "Please enter the path to the batch csv file"
$csvfile = Read-Host
$batch = Import-Csv $csvfile

Write-Host "Please enter the group name"
$group = Read-Host

Foreach ($user in $batch) {

Remove-ADGroupMember -Identity $group -Members $user.SamAccountName -Confirm:$false

}