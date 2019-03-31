Write-Host "Please enter the path to the mailbox batch csv file"
$csvfile = Read-Host
$batch = Import-Csv $csvfile

Foreach ($mailbox in $batch) {

$alias = $mailbox.Identity
$server = Get-Mailbox -Identity $mailbox.Identity | Select server
$db = Get-Mailbox -Identity $mailbox.Identity | Select database
$ou = Get-Mailbox -Identity $mailbox.Identity | Select organizationalunit

"$($alias)`t$($server)`t$($db)`t$($ou)" | Out-File ".\MbxDump.txt" -Encoding ASCII -Append

}