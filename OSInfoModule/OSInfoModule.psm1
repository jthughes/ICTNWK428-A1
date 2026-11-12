
New-Variable -Name Info -Value $null -Scope Script -Force

function Get-OSInfo {
    if ($Script:Info) {
        Write-Output $Script:Info
        return
    }
    $Parameters = @(
        "OsName",
        "OsVersion"
        "CsManufacturer",
        "CsModel",
        "CsName",
        "CsDomain",
        "OsArchitecture"
    )
    $Script:Info = Get-ComputerInfo -Property $Parameters
    Write-Output $Script:Info
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

Export-ModuleMember -Function Get-OSName
Export-ModuleMember -Function Get-RemoteServiceStatus
Export-ModuleMember -Function Get-ComputerManufacturerAndModel
Export-ModuleMember -Function Get-ComputerName
Export-ModuleMember -Function Get-ComputerDomainName
Export-ModuleMember -Function Get-TrustedHosts
Export-ModuleMember -Function Get-OSArchitecture
Export-ModuleMember -Function Get-AllOSInfo
