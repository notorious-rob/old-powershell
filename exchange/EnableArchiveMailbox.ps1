Write-Host "Please enter the path to the mailbox batch csv file"
$csvfile = Read-Host
$batch = Import-Csv $csvfile

Foreach ($mailbox in $batch) {

Enable-Mailbox -Identity $mailbox.Identity -Archive -ArchiveDatabase $mailbox.TargetArchiveDatabase

}