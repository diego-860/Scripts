# Connect to Microsoft Graph
Connect-MgGraph -Scopes "Device.Read.All"

# Function to get iOS device count
function Get-iOSDeviceCount {
    # Initialize the count
    $iosDeviceCount = 0

    # Fetch devices
    $devices = Get-MgDevice -All

    # Filter for iOS devices
    foreach ($device in $devices) {
        if ($device.DeviceOSType -eq "iOS") {
            $iosDeviceCount++
        }
    }

    return $iosDeviceCount
}

# Get and display iOS device count
$iosCount = Get-iOSDeviceCount
Write-Host "Total iOS devices managed by Intune: $iosCount"

# Disconnect from Microsoft Graph
Disconnect-MgGraph