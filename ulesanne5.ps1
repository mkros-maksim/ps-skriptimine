function Generate-Password {
    $length = 12  
    $characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_-+=<>?"
    $password = -join ((1..$length) | ForEach-Object { $characters | Get-Random })
    return $password
}

$firstName = Read-Host "Sisesta eesnimi (ainult ladina tähed)"
$lastName = Read-Host "Sisesta perenimi (ainult ladina tähed)"

$userName = ($firstName + "." + $lastName).ToLower()

$userName = $userName -replace '[^\w\.@-]', ''  

$password = Generate-Password

$csvPath = "C:\Path\To\Save\kasutajanimi.csv"
$csvData = [PSCustomObject]@{
    UserName = $userName
    Password = $password
}

if (Test-Path $csvPath) {
    $csvData | Export-Csv -Path $csvPath -Append -NoTypeInformation
} else {
    $csvData | Export-Csv -Path $csvPath -NoTypeInformation
}

try {
    $userExists = Get-ADUser -Filter {SamAccountName -eq $userName} -ErrorAction Stop
    
    Write-Host "Viga: Kasutaja '$userName' on juba olemas AD-s. Kasutaja lisamine pole võimalik."
} catch {
    try {
        New-ADUser -SamAccountName $userName -UserPrincipalName "$userName@domain.com" -Name "$firstName $lastName" `
            -GivenName $firstName -Surname $lastName -DisplayName "$firstName $lastName" `
            -AccountPassword (ConvertTo-SecureString $password -AsPlainText -Force) `
            -Enabled $true -PassThru -ErrorAction Stop
        
        Write-Host "Kasutaja '$userName' on edukalt lisatud AD-sse."
    } catch {
        Write-Host "Kasutaja '$userName' lisamine ebaõnnestus: $($_.Exception.Message)"
    }
}

if ($?) {
    Write-Host "Käsk õnnestus."
} else {
    Write-Host "Käsk ebaõnnestus."
}