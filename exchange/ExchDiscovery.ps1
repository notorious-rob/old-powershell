#Exchange Server:

Get-ExchangeServer | Select Name,DataPath,Domain,Edition,AdminDisplayVersion,Site,ServerRole | Export-Csv .\ExchangeServers.csv


#Mail Flow:

Get-AcceptedDomain | Select DomainName,DomainType,AddressBookEnabled,Default Export-Csv .\AcceptedDomains.csv
Get-SendConnector | Select Name,AddressSpaces,DNSRoutingEnabled,SmartHosts,SourceTransportServers | Out-File .\SendConnectors.txt
Get-ReceiveConnector | Select Name,Bindings,AuthMechanism,PermissionGroups,RemoteIPRanges,Enabled | Out-File .\RecieveConnectors.txt



#Database:

Get-MailboxDatabase | Select Name,ProhibitSendReceiveQuota,ProhibitSendQuota,IssueWarningQuota,MailboxRetention,DeletedItemRetention | Export-Csv .\DatabaseInfo.csv


#Mailbox:

Get-Mailbox -ResultSize Unlimited | Select Name,Alias,PrimarySMTPAddress,UserPrincipalName,SamAccountName,ProhibitSendQuota,ProhibitSendReceiveQuota,IssueWarningQuota,UseDatabaseQuotaDefaults | Export-Csv .\MailboxDump.csv
Get-Mailbox -ResultSize Unlimited | Get-MailboxStatistics | Select DisplayName,ItemCount,TotalItemSize,TotalDeletedItemSize | Export-Csv .\MailboxStatisticsDump.csv

$UserMailboxCount = (Get-Mailbox -ResultSize Unlimited).count
$RoomMailboxCount = (Get-Mailbox -ResultSize Unlimited | ?{$_.RecipientTypeDetails -eq "RoomMailbox"}).count
$EquipMailboxCount = (Get-Mailbox -ResultSize Unlimited | ?{$_.RecipientTypeDetails -eq "EquipmentMailbox"}).count
$MailContactCount = (Get-MailContact -ResultSize Unlimited ).count
$DistroGroupCount = (Get-DistributionGroup).count

Total User Mailbox Count:     $UserMailboxCount | Out-File .\MailboxCounts.txt
Room Mailbox Count:            $RoomMailboxCount | Out-File .\MailboxCounts.txt -Append
Equipment Mailbox Count:   $EquipMailboxCount | Out-File .\MailboxCounts.txt -Append
Mail Contact Count:               $MailContactCount | Out-File .\MailboxCounts.txt -Append
Distribution Group Count:    $DistroGroupCount | Out-File .\MailboxCounts.txt -Append
