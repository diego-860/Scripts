# Connect to Microsoft Graph
Connect-MgGraph -Scopes "Device.Read.All"

# Function to get total device count
function Get-TotalDeviceCount {
    # Initialize the count
    $totalDeviceCount = 0

    # Fetch devices
    $devices = Get-MgDeviceManagementManagedDevice

    # Count the total devices
    $totalDeviceCount = $devices.Count

    return $totalDeviceCount
}

# Get and display total device count
$totalCount = Get-TotalDeviceCount
Write-Host "Total devices managed by Intune: $totalCount"

# Disconnect from Microsoft Graph
Disconnect-MgGraph