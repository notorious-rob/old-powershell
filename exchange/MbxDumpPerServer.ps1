Write-Host "Please enter the path to the mailbox batch csv file"
$csvfile = Read-Host
$batch = Import-Csv $csvfile

Foreach ($mailbox in $batch) {

$alias = $mailbox.Identity
$name = Get-Mailbox -Identity $mailbox.Identity | Select Name
$db = Get-Mailbox -Identity $mailbox.Identity | Select Database
$ev = Get-Mailbox -Identity $mailbox.Identity | Select CustomAttribute10
$ou = Get-Mailbox -Identity $mailbox.Identity | Select OrganizationalUnit
$size = Get-MailboxStatistics -Identity $mailbox.Identity | Select TotalItemSize

"$($alias)`t$($name)`t$($db)`t$($ev)`t$($ou)`t$($size)" | Out-File ".\MbxDump.txt" -Encoding ASCII -Append

}