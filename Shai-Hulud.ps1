#!/usr/bin/env pwsh


Write-Host ""
Write-Host "==============================================="
Write-Host "   Searching for Shai-Hulud / npm malware IoCs"
Write-Host "==============================================="
Write-Host ""


function Section($title) {
    Write-Host ""
    Write-Host "------------------------------------------------"
    Write-Host "▶ $title"
    Write-Host "------------------------------------------------"
}


Section "1. Searching for bun_environment.js"
Get-ChildItem -Path C:\ -Filter "bun_environment.js" -Recurse -ErrorAction SilentlyContinue


Section "2. Searching for setup_bun.js"
Get-ChildItem -Path C:\ -Filter "setup_bun.js" -Recurse -ErrorAction SilentlyContinue


Section "3. Searching for .truffler-cache directories"
Get-ChildItem -Path C:\ -Filter ".truffler-cache" -Recurse -Directory -ErrorAction SilentlyContinue


Section "4. Searching for Trufflehog binaries (trufflehog.exe)"
Get-ChildItem -Path C:\ -Filter "trufflehog.exe" -Recurse -ErrorAction SilentlyContinue


Section "5. Searching package.json files with malicious preinstall script"
Get-ChildItem -Path C:\ -Filter "package.json" -Recurse -ErrorAction SilentlyContinue |
    Select-String -Pattern '"preinstall": "node setup_bun.js"' -ErrorAction SilentlyContinue


Section "6. Searching for Bun runtime (bun.exe)"
Get-ChildItem -Path C:\ -Filter "bun.exe" -Recurse -ErrorAction SilentlyContinue


Write-Host ""
Write-Host "==============================================="
Write-Host "       Scan complete — review output above"
Write-Host "==============================================="
Write-Host ""