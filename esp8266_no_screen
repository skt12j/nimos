/*
 * ==========================================================
 * VAULT OS - ESP8266 COIN NODE (HEADLESS / NO SCREEN EDITION) 
 * ==========================================================
 */

#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <ESP8266WebServer.h>
#include <EEPROM.h>

ESP8266WebServer server(80);

String currentSSID = "";
String currentWIFIPass = "";
String vaultToken = "";
String adminPass = "";
String serverIP = ""; 

bool isAPMode = false; 
bool isServerOnline = true; 
unsigned long lastPingTime = 0;

enum SystemState { BOOTING, STANDBY, READY_INSERT, OFFLINE_MODE };
SystemState currentState = BOOTING;

const int coinPin = 14;      // D5
const int relayPin = 12;     // D6
const int statusLedPin = 13; // D7

volatile int pulseCount = 0;
volatile unsigned long lastPulseTime = 0;

const unsigned long debounceDelay = 30;  
const unsigned long batchDelay = 400;    

bool insertMode = false;
unsigned long lastBlinkTime = 0;
bool ledState = false; 

unsigned long sessionExpireTime = 0; 
const unsigned long maxSessionLength = 30000; 

void ICACHE_RAM_ATTR coinInterrupt() {
  unsigned long currentTime = millis();
  if (currentTime - lastPulseTime > debounceDelay) {
    pulseCount++;
    lastPulseTime = currentTime;
  }
}

void writeString(int address, String data) {
  EEPROM.write(address, data.length());
  for (int i = 0; i < data.length(); ++i) {
    EEPROM.write(address + 1 + i, data[i]);
  }
  EEPROM.commit();
}

String readString(int address) {
  int len = EEPROM.read(address);
  if (len == 255 || len == 0 || len > 64) return ""; 
  String data = "";
  for (int i = 0; i < len; ++i) {
    data += (char)EEPROM.read(address + 1 + i);
  }
  return data;
}

const char* loginHTML = R"rawliteral(
<!DOCTYPE html><html><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
  body { background: #03060c; color: #00f3ff; font-family: 'Courier New', monospace; text-align: center; margin-top: 10vh; }
  .box { border: 2px solid #00f3ff; padding: 30px; display: inline-block; background: rgba(0,243,255,0.05); box-shadow: 0 0 20px #00f3ff; border-radius: 8px; width: 80%; max-width: 350px;}
  input[type='password'] { width: 90%; padding: 12px; margin: 20px 0; background: #000; color: #fff; border: 1px solid #00f3ff; text-align: center; font-size: 18px; letter-spacing: 2px; }
  button { background: #00f3ff; color: #000; font-weight: bold; font-size: 16px; padding: 12px 25px; border: none; cursor: pointer; box-shadow: 0 0 10px #00f3ff; width: 100%; transition: 0.2s; }
</style></head><body>
  <div class="box">
    <h2>🛡️ VAULT OS</h2><form action="/login" method="POST">
      <input type="password" name="pwd" placeholder="Enter Access Code" required autofocus>
      <button type="submit">ACCESS NODE</button>
    </form>
  </div>
</body></html>
)rawliteral";

const char* dashboardHTMLPart1 = R"rawliteral(
<!DOCTYPE html><html><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
  body { background: #03060c; color: #fff; font-family: 'Courier New', monospace; padding: 20px; max-width: 500px; margin: auto; }
  .card { border: 1px solid #00f3ff; padding: 20px; margin-bottom: 20px; background: rgba(0,243,255,0.05); border-radius: 5px; }
  h2 { color: #00f3ff; margin-top: 0; text-align: center; }
  label { font-size: 12px; color: #888; display: block; margin-bottom: 5px; margin-top: 15px;}
  input, select { width: 100%; padding: 10px; background: #000; color: #00f3ff; border: 1px solid #555; box-sizing: border-box; }
  button { width: 100%; background: #00f3ff; color: #000; font-weight: bold; padding: 12px; border: none; margin-top: 20px; }
  .btn-scan { background: #10b981; margin-top: 5px; padding: 8px; font-size: 12px; }
</style>
<script>
  function scanWifi() {
    document.getElementById('scanBtn').innerText = "Scanning...";
    fetch('/scan').then(r=>r.text()).then(html=>{
      if(html.trim() != "") document.getElementById('ssidSelect').outerHTML = "<select id='ssidSelect' name='ssid'>" + html + "</select>";
      document.getElementById('scanBtn').innerText = "Scan Networks";
    });
  }
</script>
</head><body>
  <h2>⚙️ SYSTEM CONFIG</h2><form action="/save" method="POST">
    <div class="card"><h3 style="color:#10b981; margin:0;">1. NETWORK UPLINK</h3>
    <label>Select Network</label><input type="text" id="ssidSelect" name="ssid" value=")rawliteral";

void updateLEDs() {
  unsigned long currentTime = millis();
  if (currentState == BOOTING || currentState == OFFLINE_MODE) {
    if (currentTime - lastBlinkTime > 500) { ledState = !ledState; digitalWrite(statusLedPin, ledState ? HIGH : LOW); lastBlinkTime = currentTime; }
  } else if (currentState == READY_INSERT) {
    if (currentTime - lastBlinkTime > 120) { ledState = !ledState; digitalWrite(statusLedPin, ledState ? HIGH : LOW); lastBlinkTime = currentTime; }
  } else { digitalWrite(statusLedPin, HIGH); }
}

void changeState(SystemState newState) { currentState = newState; updateLEDs(); }

bool isAuthenticated() { return server.hasHeader("Cookie") && server.header("Cookie").indexOf("auth=granted") != -1; }

void handleRoot() {
  if (isAuthenticated()) {
    String page = String(dashboardHTMLPart1) + currentSSID + R"rawliteral(">
      <button type="button" id="scanBtn" class="btn-scan" onclick="scanWifi()">Scan Networks</button>
      <label>WiFi Password</label><input type="text" name="wifi_pass" value=")rawliteral" + currentWIFIPass + R"rawliteral(">
      </div>
      <div class="card"><h3 style="color:#b026ff; margin:0;">2. SERVER SETTINGS</h3>
      <label>Ubuntu Server IP (e.g. 10.0.0.1)</label><input type="text" name="server_ip" value=")rawliteral" + serverIP + R"rawliteral(">
      <label>Vault API Master Key</label><input type="text" name="token" value=")rawliteral" + vaultToken + R"rawliteral(">
      <label>Dashboard Login Password</label><input type="text" name="admin_pwd" value=")rawliteral" + adminPass + R"rawliteral(">
      </div><button type="submit">SAVE & REBOOT</button></form></body></html>)rawliteral";
    server.send(200, "text/html", page);
  } else { server.send(200, "text/html", loginHTML); }
}

void handleLogin() {
  if (server.hasArg("pwd") && server.arg("pwd") == adminPass) {
    server.sendHeader("Set-Cookie", "auth=granted; Path=/; Max-Age=86400");
    server.sendHeader("Location", "/"); server.send(303);
  } else { server.send(401, "text/html", "<h2>❌ ACCESS DENIED</h2>"); }
}

void handleScan() {
  if (!isAuthenticated()) return server.send(401, "text/plain", "");
  int n = WiFi.scanNetworks(); String o = "";
  for (int i=0; i<n; ++i) o += "<option value='" + WiFi.SSID(i) + "'>" + WiFi.SSID(i) + "</option>";
  server.send(200, "text/plain", o);
}

void handleSave() {
  if (!isAuthenticated()) return server.send(401, "text/plain", "");
  writeString(0, server.arg("ssid")); writeString(50, server.arg("wifi_pass"));
  writeString(150, server.arg("token")); writeString(200, server.arg("admin_pwd"));
  writeString(250, server.arg("server_ip"));
  server.send(200, "text/html", "<h2>💾 SAVED! REBOOTING...</h2>");
  delay(1500); ESP.restart();
}

void handleOpenGate() {
  if (server.arg("token") != vaultToken || !isServerOnline) return server.send(401, "application/json", "{\"status\":\"error\"}");
  insertMode = true; digitalWrite(relayPin, LOW); 
  sessionExpireTime = millis() + maxSessionLength; 
  changeState(READY_INSERT);
  server.send(200, "application/json", "{\"status\":\"success\"}");
}

void handleCloseGate() {
  if (server.arg("token") != vaultToken) return server.send(401, "application/json", "{\"status\":\"error\"}");
  insertMode = false; digitalWrite(relayPin, HIGH); 
  changeState(STANDBY);
  server.send(200, "application/json", "{\"status\":\"success\"}");
}

void handlePing() { server.send(200, "application/json", "{\"status\":\"ONLINE\"}"); }

void transmitToVault(int amount) {
  if (WiFi.status() == WL_CONNECTED) {
    WiFiClient client; HTTPClient http;
    http.begin(client, "http://" + serverIP + "/portal/slot_api.php");
    http.addHeader("Content-Type", "application/x-www-form-urlencoded");
    http.POST("action=pulse&coins=" + String(amount) + "&token=" + vaultToken);
    http.end();
  }
}

void registerWithUbuntu() {
  if(WiFi.status() == WL_CONNECTED) {
    WiFiClient client; HTTPClient http;
    http.begin(client, "http://" + serverIP + "/register_esp.php?token=" + vaultToken);
    http.GET(); http.end();
  }
}

void setup() {
  Serial.begin(115200); EEPROM.begin(512); 
  pinMode(statusLedPin, OUTPUT); digitalWrite(statusLedPin, LOW);
  pinMode(relayPin, OUTPUT); digitalWrite(relayPin, HIGH); 
  pinMode(coinPin, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(coinPin), coinInterrupt, FALLING);

  changeState(BOOTING);

  currentSSID = readString(0); if(currentSSID == "") currentSSID = "NIMOS MAIN 2.4G";
  currentWIFIPass = readString(50); if(currentWIFIPass == "") currentWIFIPass = "01234567";
  vaultToken = readString(150); if(vaultToken == "") vaultToken = "111625080052";
  adminPass = readString(200); if(adminPass == "") adminPass = "01234567";
  serverIP = readString(250); if(serverIP == "") serverIP = "10.0.0.1";

  WiFi.mode(WIFI_STA); WiFi.begin(currentSSID.c_str(), currentWIFIPass.c_str());
  
  int attempts = 0;
  while (WiFi.status() != WL_CONNECTED && attempts < 25) { delay(400); updateLEDs(); attempts++; }

  if (WiFi.status() == WL_CONNECTED) { changeState(STANDBY); registerWithUbuntu(); } 
  else { isAPMode = true; WiFi.mode(WIFI_AP); WiFi.softAP("VAULT_OS_SETUP", "01234567"); changeState(STANDBY); }

  const char* headerkeys[] = {"Cookie"}; server.collectHeaders(headerkeys, 1);
  server.on("/", HTTP_GET, handleRoot); server.on("/login", HTTP_POST, handleLogin);
  server.on("/scan", HTTP_GET, handleScan); server.on("/save", HTTP_POST, handleSave);
  server.on("/open", handleOpenGate); server.on("/close", handleCloseGate);
  server.on("/ping", handlePing);
  server.begin();
}

void loop() {
  server.handleClient(); 
  unsigned long currentTime = millis();
  updateLEDs(); 

  if (currentTime - lastPingTime > 20000) {
    lastPingTime = currentTime;
    if (WiFi.status() == WL_CONNECTED && !isAPMode) {
      WiFiClient client; HTTPClient http;
      http.begin(client, "http://" + serverIP + "/portal/slot_api.php?action=status"); 
      http.setTimeout(1500); 
      int httpCode = http.GET(); http.end();
      
      if (httpCode > 0) { if (!isServerOnline) { isServerOnline = true; changeState(STANDBY); } } 
      else { if (isServerOnline) { isServerOnline = false; insertMode = false; digitalWrite(relayPin, HIGH); changeState(OFFLINE_MODE); } }
    } else { if (isServerOnline && !isAPMode) { isServerOnline = false; insertMode = false; digitalWrite(relayPin, HIGH); changeState(OFFLINE_MODE); } }
  }

  if (insertMode == true && currentTime > sessionExpireTime) {
    insertMode = false; digitalWrite(relayPin, HIGH); changeState(STANDBY);
  }

  if (pulseCount > 0 && (currentTime - lastPulseTime > batchDelay)) {
    detachInterrupt(digitalPinToInterrupt(coinPin));
    int rawPulses = pulseCount; pulseCount = 0; 
    attachInterrupt(digitalPinToInterrupt(coinPin), coinInterrupt, FALLING);

    if (rawPulses > 0) {
      sessionExpireTime = currentTime + maxSessionLength; 
      if (!isAPMode) { transmitToVault(rawPulses); }
    }
  }
}
