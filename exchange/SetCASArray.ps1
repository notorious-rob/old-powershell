$CASArrayName = Read-Host
$Databases = Get-MailboxDatabase
foreach ($DB in $Databases) {
	Set-MailboxDatabase -Identity $DB -RPCClientAccessServer $CASArrayName
	}
