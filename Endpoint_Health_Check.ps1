# Endpoint_Health_Check.ps1
# Simulated portfolio script for desktop-support troubleshooting.

Write-Host "=== Endpoint Health Check ==="

$computer = $env:COMPUTERNAME
$user = $env:USERNAME
$os = Get-CimInstance Win32_OperatingSystem
$cs = Get-CimInstance Win32_ComputerSystem
$disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"

Write-Host "`n[System]"
Write-Host "Computer: $computer"
Write-Host "User: $user"
Write-Host "OS: $($os.Caption) $($os.Version)"
Write-Host "RAM (GB): $([math]::Round($cs.TotalPhysicalMemory / 1GB, 2))"
Write-Host "C: Free Space (GB): $([math]::Round($disk.FreeSpace / 1GB, 2))"

Write-Host "`n[Network]"
Get-NetIPConfiguration | Select-Object InterfaceAlias, IPv4Address, IPv4DefaultGateway, DNSServer

Write-Host "`n[Connectivity]"
$targets = @("127.0.0.1", "8.8.8.8", "www.microsoft.com")
foreach ($target in $targets) {
    $ok = Test-Connection -ComputerName $target -Count 1 -Quiet -ErrorAction SilentlyContinue
    Write-Host "$target : $ok"
}

Write-Host "`n[DNS]"
try {
    Resolve-DnsName "www.microsoft.com" -ErrorAction Stop |
        Select-Object Name, Type, IPAddress
} catch {
    Write-Host "DNS resolution failed."
}

Write-Host "`n[Recent System Errors]"
Get-WinEvent -FilterHashtable @{LogName='System'; Level=2; StartTime=(Get-Date).AddHours(-24)} `
    -ErrorAction SilentlyContinue |
    Select-Object -First 10 TimeCreated, Id, ProviderName, Message

Write-Host "`n[Done]"
