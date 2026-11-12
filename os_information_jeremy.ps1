
function Start-Program {
    $optionExit = 9
    $prompt = 0
    while ($prompt -ne $optionExit) {
        Show-Menu
        $prompt = Read-Host "Select Menu Option [#]"
        switch ($prompt) {
            $optionExit { Write-Host "Goodbye!"}
            default     { Write-Host "Input not recognised" }
        }
        Write-Host ""
    }

}

function Show-Menu {
    Write-Host "OSInformation"
    Write-Host "[1] OS Name"
    Write-Host "[2] Windows Remote Service Status"
    Write-Host "[3] Computer Manufacturer and Model"
    Write-Host "[4] Computer Name"
    Write-Host "[5] Computer Domain Name"
    Write-Host "[6] Computer Trusted Hosts"
    Write-Host "[7] OS Architecture"
    Write-Host "[8] Display All Info"
    Write-Host "[9] Exit"
}

Start-Program
