# 🛡️ VAULT OS - PISO WIFI & WISP ECOSYS
**ENTERPRISE-GRADE SECURE DEPLOYMENT GUIDE (V2)**

## ⚙️ System Requirements
* **Compatible Hardware:** OpenWrt/ImmortalWrt compatible routers with a WAN port.
* **Compatible OS:** OpenWrt 22.03.x up to 25.x (nftables / Firewall4 / tc supported).
* **Storage:** Minimum 10MB Flash
* **RAM:** Minimum 64MB

---

## 1. Automated Dual-Band WiFi Configuration
Upon installation, Vault OS automatically scans your router's wireless chips and creates four dedicated interfaces:

**Private Admin LAN (Password Protected):**
* `NIMOS MAIN 2.4G` (Password: 01234567)
* `NIMOS MAIN 5G` (Password: 01234567)

**Piso WiFi Hotspot (Open Captive Portal):**
* `ANONIMO'S PISO WIFI 2.4G` (Open / No Password)
* `ANONIMO'S PISO WIFI 5G` (Open / No Password)

---

## 2. Advanced Network Hardening & QoS
Vault OS includes a custom-built Linux Traffic Control (HTB) and Firewall engine:
* **True WISP Segregation:** Monthly subscribers get dedicated, private speed lanes.
* **Strict Priority Queuing:** Gaming (Prio 1) > WISP (Prio 2) > Regular (Prio 4) > Portal (Prio 7).
* **Anti-Tunnel Shield:** Native firewall drops for VPNs, Proxies, and DNS tunnels.
* **Network Isolation:** Hotspot users are strictly blocked from accessing ISP modems.

---

## 3. One-Click SSH Installation

1. Connect your PC into **LAN 1** port of your OpenWrt/ImmortalWrt router to avoid being cut off during logging.
2. Connect to your OpenWrt router via SSH (enter your OpenWrt login password `root` or your default one):
   ```bash
   ssh root@192.168.1.1
   ```
3. Copy, paste, and execute the following deployment command:
   ```bash
   wget -O /tmp/install.sh "https://raw.githubusercontent.com/skt12j/nimos/main/install.sh" && sh /tmp/install.sh
   ```
4. The installer will automatically:
   * Install PHP 8 packages, coreutils-base64, and Traffic Control (tc).
   * Configure the uHTTPd web server to run directly out of the RAM-disk.
   * Auto-provision the dual-band SSIDs.
   * Write the hardened nftables engine and initialize the secure vault database.
   * Automatically reboot the router.

---

## 4. Hardware-Locked Activation & Licensing
Vault OS utilizes node-locked security tied to your router's physical MAC.

1. After reboot, connect to either the Piso WiFi or LAN network.
2. Attempting to browse the internet will automatically redirect you to the Hardware Activation page (`activate.php`).
3. The page will display your router's unique physical MAC address.
4. Send that MAC address to the administrator to receive your unique License Key.
5. Enter the key into the activation prompt. The system will securely save the license, self-destruct the activation script to prevent tampering, and unlock the full platform.

> **NOTE:** The activation license key is FREE.

---

## 5. System Access Reference
* **Captive Portal Gateway:** `[http://10.0.0.1](http://10.0.0.1)`
* **Admin Dashboard:** `[http://192.168.1.1/admin/](http://192.168.1.1/admin/)` 
  *(Note: Protected by Subnet Shield; accessible exclusively via Private LAN)*

---
> ⚠️ **WARNING:** Do not forget your admin password. Install at your own risk.
> 
> 💬 **Contact:** [@nimonyoka](https://t.me/nimonyoka) on Telegram
