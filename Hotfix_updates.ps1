function hf{
[cmdletbinding()]
Param (
   $hotfixdmy = (Read-Host "Filter systems that have hot fixes done less than the input date  dd/mm/yyyy format")
      )
      $conv =[datetime]::ParseExact($hotfixdmy,'dd/mm/yyyy',$null)
      $conv
      $res= Get-HotFix | Where-Object -Property installedon -LT $conv | ft
      #$outputfolder = 'E:\Practice Powershell\hotfix.csv'
      #Export-Csv -Path $outputfolder
      #Write-Verbose $res
        #$res
}
hf 