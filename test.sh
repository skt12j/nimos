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
