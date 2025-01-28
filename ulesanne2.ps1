
$firstName = Read-Host "Sisesta oma eesnimi"
$lastName = Read-Host "Sisesta oma perenimi"

$userName = ($firstName + "." + $lastName).ToLower()

try {
    $user = Get-LocalUser -Name $userName -ErrorAction Stop

    Remove-LocalUser -Name $userName -ErrorAction Stop
    Write-Host "Kasutaja '$userName' on edukalt kustutatud."
} catch {
    if ($_.Exception.Message -match "The term 'Get-LocalUser' is not recognized") {
        Write-Host "Kasutaja '$userName' ei eksisteeri või andmed ei ole õiges vormingus."
    } else {
        Write-Host "Kasutaja kustutamine ebaõnnestus: $($_.Exception.Message)"
    }
}

if ($?) {
    Write-Host "Käsk õnnestus."
} else {
    Write-Host "Käsk ebaõnnestus."
}