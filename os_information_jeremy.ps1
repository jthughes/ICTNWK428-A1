function Get-OSInfo {
    $RemoteServiceStatus = (Get-Service -Name "WinRM").Status
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
    $info | Add-Member -MemberType NoteProperty -Name "WinRMStatus" -Value $RemoteServiceStatus

    $output = $info | Select-Object (
        @{
            Name='OperatingSystemName'
            Expression={$_.OsName}
        },
        @{
            Name='WindowsRemoteServiceStatus'
            Expression={$_.WinRMStatus}
        },
        @{
            Name='ComputerManufacturer'
            Expression={$_.CsManufacturer}
        },
        @{
            Name='ComputerModel'
            Expression={$_.CsModel}
        },
        @{
            Name='ComputerName'
            Expression={$_.CsName}
        },
        @{
            Name='ComputerDomainName'
            Expression={$_.CsDomain}
        },
        @{
            Name='OperatingSystemArchitecture'
            Expression={$_.OsArchitecture}
        }
    )
    Write-Output $output
}

function Get-OSName {
    $info = Get-OSInfo
    Write-Output $info.OperatingSystemName
}

function Get-RemoteServiceStatus {
    $info = Get-OSInfo
    Write-Output $info.WindowsRemoteServiceStatus
}

function Get-ComputerManufacturerAndModel {
    $info = Get-OSInfo
    Write-Output "$($info.ComputerManufacturer) $($info.ComputerModel)"
}

function Get-ComputerName {
    $info = Get-OSInfo
    Write-Output $info.ComputerName
}

function Get-ComputerDomainName {
    $info = Get-OSInfo
    Write-Output $info.ComputerDomainName
}

function Get-OSArchitecture {
    $info = Get-OSInfo
    Write-Output $info.OperatingSystemArchitecture
}

function Start-Program {
    $optionExit = 9
    $prompt = 0
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
                # 6 { Write-Host "Trusted Hosts: $(Get-TrustedHosts)" }
                7 { Write-Host "Operating System Architecture: $(Get-OSArchitecture)" }
                8 { Get-OSInfo | Format-List }
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
