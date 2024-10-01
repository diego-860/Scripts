# Connect to Microsoft Graph
Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All" 

# Get the total number of devices
$devices = Get-IntuneManagedDevice
$deviceCount = $devices.Count

Write-Host "Total number of Intune devices: $deviceCount"