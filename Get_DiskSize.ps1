Function Get_DiskSize() {
<#
███████╗██╗   ██╗███╗   ██╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗     ██████╗ ███████╗████████╗     ██████╗ ██╗███████╗██╗  ██╗███████╗██╗███████╗███████╗
██╔════╝██║   ██║████╗  ██║██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║    ██╔════╝ ██╔════╝╚══██╔══╝     ██╔══██╗██║██╔════╝██║ ██╔╝██╔════╝██║╚══███╔╝██╔════╝
█████╗  ██║   ██║██╔██╗ ██║██║        ██║   ██║██║   ██║██╔██╗ ██║    ██║  ███╗█████╗     ██║        ██║  ██║██║███████╗█████╔╝ ███████╗██║  ███╔╝ █████╗  
██╔══╝  ██║   ██║██║╚██╗██║██║        ██║   ██║██║   ██║██║╚██╗██║    ██║   ██║██╔══╝     ██║        ██║  ██║██║╚════██║██╔═██╗ ╚════██║██║ ███╔╝  ██╔══╝  
██║     ╚██████╔╝██║ ╚████║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║    ╚██████╔╝███████╗   ██║███████╗██████╔╝██║███████║██║  ██╗███████║██║███████╗███████╗
╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝     ╚═════╝ ╚══════╝   ╚═╝╚══════╝╚═════╝ ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝╚══════╝╚══════╝                                                                                                                                                           
Version 1.0                                                                                                                                                                                   

.SYNOPSIS 
Get_DiskSize.ps1 - Function to get disk size.

.DESCRIPTION
Function to get disk size.

.INPUTS
N/A

.OUTPUTS
N/A
.CONFIGURATION

Set with type of disk you want with the variable $DISKDRIVE

Unknown (0)
No Root Directory (1)
Removable Disk (2)
Local Disk (3)        <- Default
Network Drive (4)
Compact Disc (5)
RAM Disk (6)

.LINK
https://docs.microsoft.com/en-us/windows/win32/cimwin32prov/win32-logicaldisk

.EXAMPLE
Add this function on your script  set a variable with the function name and call this variable for show the result. Here is an example of a result when looking for the size of local disks 


$SIZEBEFORECLEAN = Get_DiskSize
write-host $SIZEBEFORECLEAN

SystemName Drive Size (GB) FreeSpace (GB) PercentFree
---------- ----- --------- -------------- -----------
LACEXA02   C:    129,7     24,2           18,7%      
LACEXA02   E:    600,0     224,8          37,5%      
LACEXA02   F:    1 020,0   536,4          52,6%   

You can use the report in a log, an email or even directly on the screen.

.NOTES
Written by: Christophe Pelichet (c.pelichet@gmail.com)
 
Find me on: 
 
* LinkedIn:     https://linkedin.com/in/christophepelichet
* Github:       https://github.com/ChristophePelichet
 
Change Log 
V1.00 - 04/10/2020 - Initial version
#>

#######################################################
###################### Variables ######################
#######################################################

$DRIVETYPE = "3"

#######################################################
######################## Code #########################
#######################################################


	$DISKSIZE = Get-WmiObject Win32_LogicalDisk | Where-Object { $_.DriveType -eq "$DRIVETYPE" } | Select-Object SystemName, 
	@{ Name = "Drive" ; Expression = { ( $_.DeviceID ) } }, 
	@{ Name = "Size (GB)" ; Expression = {"{0:N1}" -f( $_.Size / 1gb)}}, 
	@{ Name = "FreeSpace (GB)" ; Expression = {"{0:N1}" -f( $_.Freespace / 1gb ) } }, 
	@{ Name = "PercentFree" ; Expression = {"{0:P1}" -f( $_.FreeSpace / $_.Size ) } } | 
	Format-Table -AutoSize | Out-String
	return $DISKSIZE
}

###########################################################
######################## End Code #########################
###########################################################