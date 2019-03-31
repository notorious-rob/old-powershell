Write-Host "Please enter the path to the database batch csv file"
$csvfile = Read-Host
$batch = Import-Csv $csvfile

Foreach ($db in $batch) {

Add-MailboxDatabaseCopy -Identity $db.Identity -MailboxServer $db.MailboxServer

}