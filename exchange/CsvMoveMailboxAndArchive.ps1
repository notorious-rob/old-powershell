Write-Host "Please enter the path to the mailbox batch csv file"
$csvfile = Read-Host
$batch = Import-Csv $csvfile

Foreach ($mailbox in $batch) {

New-MoveRequest -Identity $mailbox.Identity -TargetDatabase $mailbox.TargetDatabase -ArchiveTargetDatabase $mailbox.TargetArchiveDatabase

}