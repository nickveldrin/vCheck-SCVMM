$Title = "VMs with mounted ISO"
$Header ="VMs with mounted ISO"
$Comments = "VMs with mounted ISO. ISO files should be dismounted when no longer needed."
$Display = "Table"
$Author = "Jan Egil Ring"
$PluginVersion = 1.0
$PluginCategory = "SC VMM"

switch -wildcard ($VMMServer.ProductVersion) 
    { 
        "2.*" {$VMs | Get-VirtualDVDDrive | Where-Object {$_.iso} | Select-Object @{Name="VM";Expression={$_.Name}},@{Name="VMHost";Expression={(Get-VM $_.Name -ea silentlycontinue).VMHost.Name}},ISO,AddedTime | Sort-Object VM} 
        "3.*" {$VMs | Get-SCVirtualDVDDrive | Where-Object {$_.iso} | Select-Object @{Name="VM";Expression={$_.Name}},@{Name="VMHost";Expression={(Get-SCVirtualMachine $_.Name -ea silentlycontinue).VMHost.Name}},ISO,AddedTime | Sort-Object VM} 
        default {break}
    }