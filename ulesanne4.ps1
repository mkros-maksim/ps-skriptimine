$firstName = Read-Host "Sisesta oma eesnimi"
$lastName = Read-Host "Sisesta oma perenimi"

$userName = ($firstName + "." + $lastName).ToLower()

$userName = $userName -replace '[^\w\.@-]', ''  

try {
    $userExists = Get-ADUser -Filter {SamAccountName -eq $userName} -ErrorAction Stop
    
    Remove-ADUser -Identity $userExists -Confirm:$false -ErrorAction Stop
    Write-Host "Kasutaja '$userName' on edukalt kustutatud AD-st."
} catch {
    if ($_.Exception.Message -match "Could not find an object") {
        Write-Host "Viga: Kasutaja '$userName' ei leitud AD-st."
    } else {
        Write-Host "Kasutaja kustutamine ebaõnnestus: $($_.Exception.Message)"
    }
}

if ($?) {
    Write-Host "Käsk õnnestus."
} else {
    Write-Host "Käsk ebaõnnestus."
}