Add-PSSnapin Microsoft.Exchange.Management.PowerShell.Admin
Get-CASMailbox -Filter {HasActiveSyncDevicePartnership -eq $true} | foreach {Get-ActivesyncDeviceStatistics -mailbox $_.name} | Format-Table identity,devicemodel,LastSuccessSync
