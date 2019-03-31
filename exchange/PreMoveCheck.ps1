Write-Host "Please enter the path to the mailbox batch csv file"
$csvfile = Read-Host
$batch = Import-Csv $csvfile

Foreach ($mailbox in $batch) {

$LastSync = Get-ActiveSyncDeviceStatistics -Mailbox $mailbox.Identity | Select LastSuccessSync

	if ($LastSync -ne $null) {
		"$mailbox,`t$LastSync" | Out-File ".\activesync-validation.csv" -Encoding ASCII -Append
		}
$alias = $mailbox.Identity
$db = $mailbox.TargetDatabase
$displayname = Get-MailboxStatistics -Identity $mailbox.Identity | Select DisplayName
$lastlogon = Get-MailboxStatistics -Identity $mailbox.Identity | Select LastLogonTime
"$alias`t@$db`t$displayname`t$lastlogon" | Out-File ".\MbxStats.txt" -Encoding ASCII -Append

}

