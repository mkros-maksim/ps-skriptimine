Get-ChildItem -Path C:\Temp\Test

$result = Get-ChildItem -Path C:\Temp\Test -Include *.csv | Select Name, Length

Write-Host
Write-Host 'Filename': $result.Name
Write-Host 'Size in KB': $($result.Length/1KB)
Write-Host 'Size in MB': $($result.Length/1MB)