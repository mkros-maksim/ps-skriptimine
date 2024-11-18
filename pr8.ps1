while(Get-Process notepad -ErrorAction SilentlyContinue)
{
 Write-Host 'Notepad is runnung'
}