function recover-deletedADusers{
<#
.SYNOPSIS
    Restore the deleted AD user's account from the recycle bin.        

.DESCRIPTION
    Lists all the deleted AD Objects via Out-Gridview to select the user/s to be restored.
    Show the restored AD Objects on the window to prove the restoration was successful.
    Module is loaded automatically when the function is launched.
                       
.EXAMPLE
    .EXAMPLE
     PS> .\recoverADusers.psm1

.NOTES
    General notes
    Created by:    Karanjit Oberoi
    Created on:    28  Feb 2022
    Last Modified: 28 Feb 2022
                                       
#>
 [cmdletbinding()]
 Param()
  $restorename=Get-ADObject -LDAPFilter:"(msDS-LastKnownRDN=*)" -IncludeDeletedObjects | Where-Object {$_.Deleted -eq $true} |
  Out-GridView -PassThru -title "Select users to be restored" | Restore-ADObject -Confirm 
  Get-ADObject -LDAPFilter:"(msDS-LastKnownRDN=*)" -IncludeDeletedObjects | Where-Object {$_.Deleted -ne $true} | Out-GridView -Title "List of restored Users"
}
