import CoreWLAN

if let iface = CWWiFiClient.shared().interface(),
   let ssid = iface.ssid() {
    print("SSID: \(ssid)")
    print("Signal strength (RSSI): \(iface.rssiValue()) dBm")
    print("Noise: \(iface.noiseMeasurement()) dBm")
} else {
    print("No Wi-Fi connection detected")
}
