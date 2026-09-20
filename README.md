=====================================

VAULT OS - PISO WIFI & WISP ECOSYS         
ENTERPRISE-GRADE SECURE DEPLOYMENT GUIDE (V2)


SYSTEM REQUIREMENTS:
- Compatible Hardware: Openwrt/Immortawrt compatible routers. with wan port. 
- Compatible OS: OpenWrt 22.03.x up to 25.x (nftables / Firewall4 / tc supported)
- Storage: Minimum 10MB Flash
- RAM: Minimum 64MB

=====================================
 1. AUTOMATED DUAL-BAND WIFI CONFIGURATION
=====================================

Upon installation, Vault OS automatically scans your router's wireless chips 
and creates four dedicated interfaces:

- Private Admin LAN (Password Protected):
  * NIMOS MAIN 2.4G  (Password: 01234567)
  * NIMOS MAIN 5G    (Password: 01234567)

- Piso WiFi Hotspot (Open Captive Portal):
  * ANONIMO'S PISO WIFI 2.4G  (Open / No Password)
  * ANONIMO'S PISO WIFI 5G    (Open / No Password)

=====================================
 2. ADVANCED NETWORK HARDENING & QoS
===================================== 
Vault OS includes a custom-built Linux Traffic Control (HTB) and Firewall engine:
- True WISP Segregation: Monthly subscribers get dedicated, private speed lanes.
- Strict Priority Queuing: Gaming (Prio 1) > WISP (Prio 2) > Regular (Prio 4) > Portal (Prio 7).
- Anti-Tunnel Shield: Native firewall drops for VPNs, Proxies, and DNS tunnels.
- Network Isolation: Hotspot users are strictly blocked from accessing ISP modems.

=====================================
 3. ONE-CLICK SSH INSTALLATION
=====================================


1.0 Connect your pc into lan 1 port. to avoid cutting off from the logging.

1.1 Connect to your OpenWrt router via SSH:
   ssh root@192.168.1.1 (enter your openwrt login password (root) or your default one)

2. Copy, paste, and execute the following deployment command:

   wget -O /tmp/install.sh "https://raw.githubusercontent.com/skt12j/nimos/main/install.sh" && sh /tmp/install.sh

3. The installer will automatically:
   - Install PHP 8 packages, coreutils-base64, and Traffic Control (tc).
   - Configure the uHTTPd web server to run directly out of the RAM-disk.
   - Auto-provision the dual-band SSIDs.
   - Write the hardened nftables engine and initialize the secure vault database.
   - Automatically reboot the router.

=====================================
 4. HARDWARE-LOCKED ACTIVATION & LICENSING
=====================================

Vault OS utilizes node-locked security tied to your router's physical MAC.

1. After reboot, connect to either the Piso WiFi or LAN network.
2. Attempting to browse the internet will automatically redirect you to the Hardware Activation page (`activate.php`).
3. The page will display your router's unique physical MAC address.
4. Send that MAC address to the administrator to receive your unique License Key.
5. Enter the key into the activation prompt. The system will securely save the license, self-destruct the activation script to prevent tampering,and unlock the full platform.

=====================================
 5. SYSTEM ACCESS REFERENCE
=====================================

- Captive Portal Gateway: http://10.0.0.1
- Admin Dashboard: http://192.168.1.1/admin/
  (Note: Protected by Subnet Shield; accessible exclusively via Private LAN)
=======================================

NOTE:

Do not forget your admin password. (Install at your own risk) 
