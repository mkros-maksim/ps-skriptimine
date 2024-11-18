Write-Host 'Select Country' -ForegroundColor Yellow
Write-Host '1: India' -ForegroundColor Cyan
Write-Host '2: Australia' -ForegroundColor Cyan
Write-Host '3: China' -ForegroundColor Cyan

$choice = Read-Host 'Please select country'

if($choice -eq '1')
  {
    Write-Host 'Indias capital is New Delhi' -ForegroundColor Green
  }
elseif($choice -eq '2')
  {
    Write-Host 'Australias capital is Canberra' -ForegroundColor Green
  }
elseif($choice -eq '3')
  {
    Write-Host 'China capital is Beijing' -ForegroundColor Green
  }
else
  {
    Write-Host 'Entered value is wrong' -ForegroundColor Red
  }