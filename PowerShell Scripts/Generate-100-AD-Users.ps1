Import-Module ActiveDirectory

# Read the CSV file
$users = Import-Csv -Path C:\Users\domaindiego\Desktop\customers-100.csv

# Define variables
$password = Read-Host "What will the password be for the created users?"
$domain = "ayalastudios.com"
$ou = "OU=test,DC=ayalastudios,DC=com"

# Define array of job titles
$JobTitles = @(
    "Administrator",
    "Manager",
    "Specalist",
    "Software Developer",
    "Desktop Support",
    "Project Manager",
    "Architect",
    "Mobility Technician",
    "Network Engineer",
    "Cloud Advocate"
)

# Get a random index from the array
$RandomIndex = Get-Random -Minimum 0 -Maximum $JobTitles.Length

# Retrieve the random job title
$RandomJobTitle = $JobTitles[$RandomIndex]

# Loop to create 100 users
foreach ($user in $users) {
    $username = $user.FirstName + $user.LastName
    $email = "$username@$domain"
    $upn = "$username@$domain"

    New-ADUser -Name $username -Path $ou -AccountPassword (ConvertTo-SecureString -AsPlainText $password -Force) -EmailAddress $email -Title $RandomJobTitle -UserPrincipalName $upn -Enabled $true
}
