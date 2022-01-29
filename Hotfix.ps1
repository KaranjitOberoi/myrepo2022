$outputfolder = 'E:\Practice Powershell\hotfix.csv'
function hf{
[cmdletbinding()]
Param (
   $hotfixdmy = (Read-Host "Enter the numbnerof days":)
      )
      #$hotfixdmy
      #$res= Get-HotFix | Where-Object -Property installedon -LT $hotfixdmy| Export-Csv -Path $outputfolder
      $dayscal =((Get-Date).AddDays(- $hotfixdmy))
       $dayscal
      $res= Get-HotFix | Where-Object -Property installedon -gT $daycal
      $res 
 
}
hf 