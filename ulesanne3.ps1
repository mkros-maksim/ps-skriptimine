$firstName = Read-Host "Sisesta oma eesnimi"
$lastName = Read-Host "Sisesta oma perenimi"

$userName = ($firstName + "." + $lastName).ToLower()

try {
    $userExists = Get-ADUser -Filter {SamAccountName -eq $userName} -ErrorAction Stop
    
    Write-Host "Viga: Kasutaja '$userName' on juba olemas AD-s. Kasutaja lisamine pole võimalik."
} catch {
    try {
        
        New-ADUser -SamAccountName $userName -UserPrincipalName "$userName@domain.com" -Name "$firstName $lastName" `
            -GivenName $firstName -Surname $lastName -DisplayName "$firstName $lastName" `
            -AccountPassword (ConvertTo-SecureString "Parool1!" -AsPlainText -Force) `
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