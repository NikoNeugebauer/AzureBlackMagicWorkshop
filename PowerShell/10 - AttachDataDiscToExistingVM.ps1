# Add Unmanaged Disc to VM

$resourceGroupName = "BlackMagicCGNVM"
$vmName = "VirtualMachine12"

$StorageAccount = Get-AzureRmStorageAccount -ResourceGroupName $resourceGroupName `

$vm = Get-AzureRMVM -ResourceGroupName $resourceGroupName `

$DataDiscUri = $StorageAccount.PrimaryEndpoints.Blob.ToString() + "vhds/" + "$vmName-DataDisc-1" + ".vhd"
$DataDiscUri2 = $StorageAccount.PrimaryEndpoints.Blob.ToString() + "vhds/" + "$vmName-DataDisc-2" + ".vhd"

$VirtualMachine = Add-AzureRmVMDataDisk -VM $vm `

$VirtualMachine = Add-AzureRmVMDataDisk -VM $vm `

update-azurermvm -VM $VirtualMachine -ResourceGroupName $resourceGroupName



# Add Managed Disc to VM

$resourceGroupName = "BlackMagicCGNVM"
$vmName = "mdvm1"
$diskName = "DataDisk"
$diskSize = 1023

$localPath = "C:\Users\tillm\OneDrive\Vortr�ge\Azure Black Magic\BlackMagicWorkshop\BlackMagicWorkshop\"
. "$($localPath)\Functions\New-AzureRmManagedDisk.ps1"
New-AzureRmManagedDisk -diskname $diskName `
                       -diskSize $diskSize `
                       -vmName $vmName `
                       -resourceGroup $resourceGroupName `
                       -location $Location
