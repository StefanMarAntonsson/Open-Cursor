function Open-Cursor {
    $cmdPath = (Get-Command cursor | Select-Object -ExpandProperty Source)
    if (Test-Path $cmdPath) {
        if ($args.Count -eq 0) {
            $args = "."
        }
        $argList = "/c `"$cmdPath`" $args"
        Start-Process "cmd.exe" -ArgumentList $argList -WindowStyle Hidden
        exit
    }
    else {
        Write-Host "❌ cursor.cmd not found" -ForegroundColor Red
    }
}

# Aliases for convenience
Set-Alias cop Open-Cursor
Set-Alias copen Open-Cursor