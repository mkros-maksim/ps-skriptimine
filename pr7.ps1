$colors = "Red", "Green", "Yellow", "Blue"


$students = 1..20


$students | ForEach-Object {
    
    $randomColor = $colors | Get-Random

    
    [PSCustomObject]@{
        RollNumber = $_
        Group      = $randomColor
    }
} | Format-Table -Property RollNumber, Group