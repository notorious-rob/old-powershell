$vms = Import-Csv "NewVMs.csv"
foreach ($vm in $vms){
	$Template = Get-Template $vm.Template
	$VMHost = Get-VMHost $vm.Host
	$Datastore = Get-Datastore $vm.Datastore
	$OSCustomization = Get-OSCustomizationSpec $vm.Customization
	
	New-VM -Name $vm.Name -Template $Template -VMHost $VMHost -Datastore $Datastore -OSCustomizationSpec $OSCustomization -RunAsync
	}