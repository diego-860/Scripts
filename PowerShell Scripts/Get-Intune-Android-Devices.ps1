# Connect to Microsoft Graph
Connect-MgGraph -Scopes "Device.Read.All"

# Function to get Android device count
function Get-AndroidDeviceCount {
    # Initialize the count
    $androidDeviceCount = 0

    # Fetch devices
    $devices = Get-MgDevice -All

    # Filter for Android devices
    foreach ($device in $devices) {
        if ($device.DeviceOSType -eq "Android") {
            $androidDeviceCount++
        }
    }

    return $androidDeviceCount
}

# Get and display Android device count
$androidCount = Get-AndroidDeviceCount
Write-Host "Total Android devices managed by Intune: $androidCount"

# Disconnect from Microsoft Graph
Disconnect-MgGraph
