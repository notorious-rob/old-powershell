Write-Host "Please enter the path to the mailbox batch csv file"
$csvfile = Read-Host
$batch = Import-Csv $csvfile

Foreach ($mailbox in $batch) {

$LastSync = Get-ActiveSyncDeviceStatistics -Mailbox $mailbox.Identity | Select LastSuccessSync

	if ($LastSync -ne $null) {
		$mailbox.Identity,$LastSync | Out-File ".\activesync-validation.csv" -Append
		}

}