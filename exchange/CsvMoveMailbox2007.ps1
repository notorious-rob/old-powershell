Write-Host "Please enter the path to the mailbox batch csv file"
$csvfile = Read-Host
$batch = Import-Csv $csvfile

Foreach ($mailbox in $batch) {

Move-Mailbox -Identity $mailbox.Identity -TargetDatabase $mailbox.TargetDatabase -BadItemLimit 20 -MaxThreads 20 -PreserveMailboxSizeLimit

}