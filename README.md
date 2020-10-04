# Function-Get_DiskSize

## Description
- Function to get disk size.

## Configuration 

Set with type of disk you want with the variable **$DISKDRIVE**
- Unknown (0)
- No Root Directory (1)
- Removable Disk (2)
- Local Disk (3)        **<- Default**
- Network Drive (4)
- Compact Disc (5)
- RAM Disk (6)

## Link
https://docs.microsoft.com/en-us/windows/win32/cimwin32prov/win32-logicaldisk

## Example

- Add this function on your script  set a variable with the function name and call this variable for shor the result. Here is an example of a result when looking for the size of local disks
 ```
$SIZEBEFORECLEAN = Get_DiskSize
write-host $SIZEBEFORECLEAN

SystemName Drive Size (GB) FreeSpace (GB) PercentFree
---------- ----- --------- -------------- -----------
LACEXA02   C:    129,7     24,2           18,7%      
LACEXA02   E:    600,0     224,8          37,5%      
LACEXA02   F:    1 020,0   536,4          52,6% 
```

- You can use the report in a log, an email or even directly on the screen.

## Changelog
V1.00 - 04/10/2020 - Initial version
