Write-Host 'Enter Azure Subscription Name'
$AzureTarget = Read-Host 
Write-Host 'Enter Azure VM Name'
$AzureVM = Read-Host 

Add-AzureAccount
Select-AzureSubscription -SubscriptionName $AzureTarget
$vm = Get-AzureVM -ServiceName $AzureVM -Name $AzureVM
for ($i=2500; $i -le 5000; $i++)
{
    $EndpointName = "VeeamRepo_"
    $EndpointName += $i
    Add-AzureEndpoint -Name $EndpointName -Protocol "tcp" -PublicPort $i -LocalPort $i -VM $vm
}
$vm | Update-AzureVM
