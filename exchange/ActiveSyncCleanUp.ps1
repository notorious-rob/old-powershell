Get-CASMailbox -resultsize unlimited | where {$_.ActiveSyncEnabled -eq "True"}
Export-Csv ".\ASEnabledUsers.csv"

$ASUsers = Import-Csv ".\ASEnabledUsers.csv"
foreach ($mailbox in $ASUsers){
	$LastSuccessSync = Get-ActiveSyncDeviceStatistics | Select LastSuccessSync
	
	if ($LastSuccessSync -eq $null){
		Set-CASMailbox $mailbox.Identity -ActiveSyncEnabled $false
		}
}