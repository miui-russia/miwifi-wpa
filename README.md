# miwifi-wpa

A wpa_supplicant installation tool for MiWiFi mini router

### Setup

##### Downloading

Clone this repository, or download it as a *.zip archive then unzip it.

##### Installation

Copy miwifi-wpa directory into an USB flash drive or hard drive.

Plug this storage device into your router.

Make sure you have root access to your router.

Use these commands to install:

	$ cd miwifi-wpa
	$ ./install.sh

Enter your IEEE 802.1X indentity and password when asked.

This script will install wpad and wpa-cli for you.

If you DO NOT have Internet access during installation, this script will complain.

But don't worry. After running install.sh, use this command to install offline packages:

	$ unzip -o data.zip -d /extdisks/sda1

##### Configuration

The configuration file's location is /etc/wpa_supplicant.conf. Modify it if you need.

### Usage

Use this command to start wpad:

	$ /etc/init.d/wpa start


Use this command to check the status of wpa_cli:

	$ /etc/init.d/wpa status

Use this command to stop wpad:

	$ /etc/init.d/wpa stop

### Contact

Owner: William Lu

Email: wy.william.lu@gmail.com
