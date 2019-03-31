Get-Content .\servers.txt | `

ForEach-Object {

Get-WMIObject Win32_NetworkAdapterConfiguration -Computername $_ | `

Where-Object {$_.IPEnabled -match "True"} | `

Select-Object -property DNSHostName,@{N="DNSServerSearchOrder";E={"$($_.DNSServerSearchOrder)"}},@{N='IPAddress';E={$_.IPAddress}}

} | Export-CSV -path servers.csv -NoTypeInformation