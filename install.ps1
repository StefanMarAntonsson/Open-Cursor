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

# Append the function to the profile
Write-Host "🛠 Adding Open-Cursor function to your PowerShell profile..." -ForegroundColor Cyan
Add-Content -Path $PROFILE -Value "`n$functionCode`n"

Write-Host "✅ Open-Cursor installed!" -ForegroundColor Green
Write-Host "ℹ️ Reload your profile with: . `$PROFILE" -ForegroundColor Yellow