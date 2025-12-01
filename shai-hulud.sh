#!/usr/bin/env bash

echo ""
echo "==============================================="
echo "   Searching for Shai-Hulud / npm malware IoCs"
echo "==============================================="
echo ""

# Utility function for section headers
section() {
    echo ""
    echo "------------------------------------------------"
    echo "▶ $1"
    echo "------------------------------------------------"
}

section "1. Searching for bun_environment.js"
sudo find / -type f -name "bun_environment.js" 2>/dev/null

section "2. Searching for setup_bun.js"
sudo find / -type f -name "setup_bun.js" 2>/dev/null

section "3. Searching for .truffler-cache directories"
sudo find / -type d -name ".truffler-cache" 2>/dev/null

section "4. Searching for Trufflehog binaries"
sudo find / -type f -name "trufflehog" 2>/dev/null
sudo find / -type f -name "trufflehog.exe" 2>/dev/null

section "5. Searching package.json files with malicious preinstall script"
grep -R "\"preinstall\": \"node setup_bun.js\"" ~ / 2>/dev/null

section "6. Searching for suspicious Bun installations"
sudo find / -type f -name "bun" 2>/dev/null | grep -v "/usr/bin"

echo ""
echo "==============================================="
echo "       Scan complete — review output above"
echo "==============================================="
echo ""
