# miwifi-wpa

A wpa_supplicant installation tool for MiWiFi mini router

### Setup

##### Downloading

Clone this repository, or download it as a *.zip archive then unzip it.

##### Installation

Copy miwifi-wpa directory into an USB flash drive or hard drive.

Plug this storage device into your router.

Make sure you have root access to your router.

Use this commands to install:

	$ cd miwifi-wpa
	$ ./install.sh

Enter your IEEE8021X indentity and password when asked.

This script will install wpad and wpa-cli for you.

If you DO NOT have Internet access during installation, this script will complain.

But don't worry. After running install.sh, use this command to install offline packages:

	$ unzip -o data.zip -d /extdisks/sda1

##### Configuration

The configuration file's location is /etc/wpa_supplicant.conf. Modify it if you need.

##### Usage

Use this commands to start wpad:

	$ ./wpa-service start


Use this commands to check the status of wpa_cli:

	$ ./wpa-service status

Use this commands to stop wpad:

	$ ./wpa-service stop

### Contact

Owner: William Lu

Email: wy.william.lu@gmail.com
