$a = Read-Host "Enter first number: "
$b = Read-Host "Enter second number: "
Write-Host "Calculator" -ForegroundColor Green
Write-Host "1: Addition" -ForegroundColor Yellow
Write-Host "2: Subtraction" -ForegroundColor Yellow
Write-Host "3: Division" -ForegroundColor Yellow
Write-Host "4: Multiplication" -ForegroundColor Yellow
$choice = Read-Host "Please enter your choice"
switch($choice)
{
1
{
$([int]$a + [int]$b)
}
2
{
$([int]$a - [int]$b)
}
3
{
$([int]$a / [int]$b)
}
4
{
$([int]$a * [int]$b)
}

}

