function mainmenu {
    Write-Host "`t`t`tArea Calculator" -ForegroundColor Green
    Write-Host "`n`t`t`tMain Menu" -ForegroundColor Yellow
    Write-Host "`nPlease select the option to perform the respective task`n" -ForegroundColor Yellow
    Write-Host "1: Area of Square" -ForegroundColor Green
    Write-Host "2: Area of Rectangle" -ForegroundColor Green
    Write-Host "3: Area of Circle" -ForegroundColor Green
    Write-Host "4: Area of Triangle" -ForegroundColor Green
    Write-Host "5: Exit`n" -ForegroundColor Green
    $choice = Read-Host "Enter your choice"
    
    
    if ($choice -match '^\d+$' -and $choice -ge 1 -and $choice -le 5) {
        return $choice
    } else {
        Write-Host "`nIncorrect entry, please enter a number between 1 and 5." -ForegroundColor Red
        return $null
    }
}

function checkmenu {
    Write-Host "`n`nPlease select the next option" -ForegroundColor Yellow
    Write-Host "`n1: Return to Main Menu" -ForegroundColor Green
    Write-Host "2: Exit`n" -ForegroundColor Green
    $ch2 = Read-Host "Enter your choice"
    
    
    if ($ch2 -match '^\d+$' -and ($ch2 -eq "1" -or $ch2 -eq "2")) {
        if ($ch2 -eq "1") {
            return $true
        }
        elseif ($ch2 -eq "2") {
            exit
        }
    } else {
        Write-Host "`nEnter correct option" -ForegroundColor Red
        return $false
    }
}

function square {
    cls
    Write-Host "`t`t`tArea of Square`n" -ForegroundColor Green
    $side = Read-Host "Enter the side of the square"

   
    try {
        $side = [int]$side
        $area = $side * $side
        Write-Host "`nArea of the square : $area" -ForegroundColor Green
        return (checkmenu)
    } catch {
        Write-Host "`nInvalid input, please enter a valid number for side." -ForegroundColor Red
        return $false
    }
}

function rectangle {
    cls
    Write-Host "`t`tArea of Rectangle`n" -ForegroundColor Green
    $length = Read-Host "Enter length of the rectangle"
    $breadth = Read-Host "Enter breadth of the rectangle"

   
    try {
        $length = [int]$length
        $breadth = [int]$breadth
        $area = $length * $breadth
        Write-Host "`nArea of the rectangle : $area" -ForegroundColor Green
        return (checkmenu)
    } catch {
        Write-Host "`nInvalid input, please enter valid numbers for length and breadth." -ForegroundColor Red
        return $false
    }
}

function circle {
    cls
    Write-Host "`t`tArea of Circle`n" -ForegroundColor Green
    $radius = Read-Host "Enter the radius of the circle"

    
    try {
        $radius = [int]$radius
        $area = 3.14 * $radius * $radius
        Write-Host "`nArea of the circle : $area" -ForegroundColor Green
        return (checkmenu)
    } catch {
        Write-Host "`nInvalid input, please enter a valid number for radius." -ForegroundColor Red
        return $false
    }
}

function triangle {
    cls
    Write-Host "`t`tArea of Triangle`n" -ForegroundColor Green
    $height = Read-Host "Enter height of triangle"
    $base = Read-Host "Enter base of triangle"

    
    try {
        $height = [int]$height
        $base = [int]$base
        $area = 0.5 * $height * $base
        Write-Host "`nArea of Triangle : $area" -ForegroundColor Green
        return (checkmenu)
    } catch {
        Write-Host "`nInvalid input, please enter valid numbers for height and base." -ForegroundColor Red
        return $false
    }
}

do {
    cls
    $ch1 = mainmenu
    if ($ch1 -eq $null) { continue } 
    switch ($ch1) {
        "1" {
            cls
            $continue = square
            if (-not $continue) { break }
        }
        "2" {
            cls
            $continue = rectangle
            if (-not $continue) { break }
        }
        "3" {
            cls
            $continue = circle
            if (-not $continue) { break }
        }
        "4" {
            cls
            $continue = triangle
            if (-not $continue) { break }
        }
        "5" {
            Write-Host "Exiting..." -ForegroundColor Red
            exit
        }
        default {
            Write-Host "`nIncorrect entry, please try again." -ForegroundColor Red
        }
    }
} while ($ch1 -ne "5")