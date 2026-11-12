function Get-OSInfo {
    $Parameters = @(
        "OsName",
        "OsVersion"
        "CsManufacturer",
        "CsModel",
        "CsName",
        "CsDomain",
        "OsArchitecture"
    )
    $info = Get-ComputerInfo -Property $Parameters
    Write-Output $info
}

function Get-OSName {
    $info = Get-OSInfo
    Write-Output $info.OsName
}

function Get-RemoteServiceStatus {
    Write-Output (Get-Service -Name "WinRM").Status
}

function Get-ComputerManufacturerAndModel {
    $info = Get-OSInfo
    Write-Output "$($info.CsManufacturer) $($info.CsModel)"
}

function Get-ComputerName {
    $info = Get-OSInfo
    Write-Output $info.CsName
}

function Get-ComputerDomainName {
    $info = Get-OSInfo
    Write-Output $info.CsDomain
}

function Get-TrustedHosts {
    Write-Output $(Get-ITem WSMan:\localhost\Client\TrustedHosts).Value
}
function Get-OSArchitecture {
    $info = Get-OSInfo
    Write-Output $info.OsArchitecture
}

function Get-AllOSInfo {
    $info = Get-OSInfo
    $info | Add-Member -MemberType NoteProperty -Name "WinRMStatus" -Value (Get-RemoteServiceStatus)
    $info | Add-Member -MemberType NoteProperty -Name "TrustedHosts" -Value (Get-TrustedHosts)
    Write-Output $info
}

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
