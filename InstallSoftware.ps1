# Check if NuGet installed
if (-not (Get-PackageProvider -Name NuGet -ErrorAction SilentlyContinue)) {
    Install-PackageProvider -Name NuGet -Force | Out-Null
}

# Check if WinGet installed
if (-not (Get-Module -ListAvailable -Name Microsoft.WinGet.Client)) {
    Install-Module -Name Microsoft.WinGet.Client -Force -Repository PSGallery | Out-Null
}

# if Installed Fix
if (Get-Command Repair-WinGetPackageManager -ErrorAction SilentlyContinue) {
    Repair-WinGetPackageManager -AllUsers
}

$appIds = @(
#General apps
    "Google.Chrome",
    "7zip.7zip",
    "Oracle.JDK.24",
    "Mozilla.Firefox.pl",
    "Spotify.Spotify",
    "QNAP.NetBakPCAgent",
    "QNAP.Qsync",
    "dotPDN.PaintDotNet",
    "Notepad++.Notepad++",
    "Mozilla.Thunderbird.pl",
#Business apps
    "Microsoft.Teams",
    "TheDocumentFoundation.LibreOffice",
    "Adobe.Acrobat.Reader.64-bit",
    "HARMAN.AdobeAIR",
    "Kingsoft.WPSOffice",
    "Zoom.Zoom",
#    "SlackTechnologies.Slack",
    "Notion.Notion"
#Remote access
#    "TeamViewer.TeamViewer",
#    "AnyDesk.AnyDesk",
#    "Microsoft.RemoteDesktopClient"
)

foreach ($app in $appIds) {
    try {
        Write-Host ("Installing {0}..." -f $app)
        $output = winget install --id $app --silent --accept-package-agreements --accept-source-agreements 2>&1

        if ($output -match "Successfully installed|Installation succeeded") {
            Write-Host ("Installed: {0}`n" -f $app)
        }
        elseif ($output -match "No applicable upgrade|already installed|is already installed") {
            Write-Host ("Already installed {0}`n" -f $app)
        }
        elseif ($output -match "No package found matching input criteria") {
            Write-Warning ("Nie znaleziono pakietu {0}`n" -f $app)
        }
        else {
            Write-Warning ("Status not found {0}" -f $app)
            Write-Host $output
        }
    }
    catch {
        Write-Error ("Error while installing {0} : {1}" -f $app, $_)
    }
}
