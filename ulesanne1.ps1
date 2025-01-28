$firstName = Read-Host "Sisesta oma eesnimi"
$lastName = Read-Host "Sisesta oma perenimi"

$userName = ($firstName + "." + $lastName).ToLower()

$fullName = "$firstName $lastName"
$description = "Lokaalne kasutajakonto"

$password = ConvertTo-SecureString "Parool1!" -AsPlainText -Force

try {
    New-LocalUser -Name $userName -Password $password -FullName $fullName -Description $description -ErrorAction Stop
    Write-Host "Kasutaja '$userName' on edukalt loodud."
} catch {
    if ($_.Exception.Message -match "The user already exists") {
        Write-Host "Viga: Kasutaja '$userName' eksisteerib juba."
    } else {
        Write-Host "Kasutaja loomisel tekkis viga: $($_.Exception.Message)"
    }
}
#Kui $? on True, siis käsk õnnestus ja kuvatakse sõnum "Käsk õnnestus."
#Kui $? on False, siis käsk ebaõnnestus ja kuvatakse sõnum "Käsk ebaõnnestus."
if ($?) {
    Write-Host "Käsk õnnestus."
} else {
    Write-Host "Käsk ebaõnnestus."
}