# Modified and updated by Marius I. Mihailescu, Ph.D. Eng.
# Last update: 7/5/2018

import-module activedirectory 
$domain = "PUT YOUR DOMAIN HERE" 
$DaysInactive = 300 
$time = (Get-Date).Adddays(-($DaysInactive))
 
# Get all AD computers with lastLogonTimestamp less than our time
Get-ADComputer -Filter {LastLogonTimeStamp -lt $time} -Properties LastLogonTimeStamp |
 
# Output hostname and lastLogonTimestamp into CSV
select-object Name,@{Name="Stamp"; Expression={[DateTime]::FromFileTime($_.lastLogonTimestamp)}} | export-csv C:\OLD_Computer.csv -notypeinformation