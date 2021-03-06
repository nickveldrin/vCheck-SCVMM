$Title = "Dynamically Expanding Disks"
$Header ="Dynamically Expanding Disks"
$Comments = "Virtual Disks of type 'DynamicallyExpanding'"
$Display = "Table"
$Author = "Jan Egil Ring"
$PluginVersion = 1.0
$PluginCategory = "SC VMM"

switch -wildcard ($VMMServer.ProductVersion) 
    { 
        "2.*" {$VMs | Get-VirtualHardDisk | Where-Object {$_.VHDType -eq "DynamicallyExpanding"} | Sort-Object name | Select-Object Name,VMHost,location,@{Name="Size (GB)";Expression={"{0:N0}" -f ($_.size / 1gb)}},@{Name="Maximumsize (GB)";Expression={"{0:N0}" -f ($_.maximumsize / 1gb)}}} 
        "3.*" {$VMs | Get-SCVirtualHardDisk | Where-Object {$_.VHDType -eq "DynamicallyExpanding"} | Sort-Object name | Select-Object Name,VMHost,location,@{Name="Size (GB)";Expression={"{0:N0}" -f ($_.size / 1gb)}},@{Name="Maximumsize (GB)";Expression={"{0:N0}" -f ($_.maximumsize / 1gb)}}} 
        default {break}
    }
