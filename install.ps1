# URL to the raw Open-Cursor.ps1 file in your GitHub repo
$functionUrl = "https://raw.githubusercontent.com/StefanMarAntonsson/Open-Cursor/main/Open-Cursor.ps1"

Write-Host "📥 Downloading Open-Cursor function..." -ForegroundColor Cyan
try {
    $functionCode = Invoke-WebRequest -Uri $functionUrl -UseBasicParsing | Select-Object -ExpandProperty Content
} catch {
    Write-Host "❌ Failed to download Open-Cursor.ps1" -ForegroundColor Red
    exit
}

# Ensure the PowerShell profile file exists
if (-not (Test-Path $PROFILE)) {
    Write-Host "📝 Creating PowerShell profile at $PROFILE" -ForegroundColor Yellow
    New-Item -ItemType File -Path $PROFILE -Force | Out-Null
}

# Read the current profile content
$profileContent = Get-Content -Path $PROFILE -Raw

# Check if the function already exists
if ($profileContent -match "function\s+Open-Cursor") {
    Write-Host "ℹ️ Open-Cursor function already exists in your profile. Skipping add." -ForegroundColor Yellow
} else {
    Write-Host "🛠 Adding Open-Cursor function to your PowerShell profile..." -ForegroundColor Cyan
    Add-Content -Path $PROFILE -Value "`n$functionCode`n"
    Write-Host "✅ Open-Cursor installed!" -ForegroundColor Green
}

# Auto-reload the profile so the function is available immediately
Write-Host "🔄 Reloading your PowerShell profile..." -ForegroundColor Cyan
. $PROFILE

Write-Host "🎉 Done! You can now use 'cop', 'copen', or 'Open-Cursor' right away." -ForegroundColor Green