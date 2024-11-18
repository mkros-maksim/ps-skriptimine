$value1 = Read-Host "Enter the first value"
$value2 = Read-Host "Enter the second value"
if($value1 -gt $value2){
Write-Host "The higher number is : "$value1
}else{
Write-Host "The higher number is : "$value2
}