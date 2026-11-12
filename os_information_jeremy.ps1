Import-Module -Name .\OSInfoModule\OSInfoModule

function Start-Program {
    $optionExit = 9
    $prompt = 0

    $osInfo
    while ($prompt -ne $optionExit) {
        Show-Menu
        $prompt = Read-Host "Select Menu Option [#]"
        Write-Host ""
        try {
            switch ($prompt) {
                1 { Write-Host "Operating System Name: $(Get-OSName)" }
                2 { Write-Host "Windows Remote Service Status: $(Get-RemoteServiceStatus)" }
                3 { Write-Host "Computer Manufacturer and Model: $(Get-ComputerManufacturerAndModel)" }
                4 { Write-Host "Computer Name: $(Get-ComputerName)" }
                5 { Write-Host "Computer Domain Name: $(Get-ComputerDomainName)" }
                6 { Write-Host "Trusted Hosts: $(Get-TrustedHosts)" }
                7 { Write-Host "Operating System Architecture: $(Get-OSArchitecture)" }
                8 { Get-AllOSInfo | Format-List }
                $optionExit { Write-Host "Goodbye!"}
                default     { Write-Host "Input not recognised" }
            }
        } catch {
            Write-Host = "Error"
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
