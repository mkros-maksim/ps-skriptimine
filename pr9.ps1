$displayCount = 0


do {
    $notepadProcesses = Get-Process notepad -ErrorAction SilentlyContinue
   
    if ($notepadProcesses) {
        $displayCount++
        
        Write-Host "Notepad is running"
    }
    
    Start-Sleep -Seconds 1
    
} while ($notepadProcesses)  

Write-Host "The message was displayed $displayCount times."