#!/bin/ash


# Configuration
# -------------
ROOTDIR=/extdisks/sda1/data


# Opkg
# ----

echo "Setup Opkg..."

touch /etc/opkg.conf
release=barrier_breaker
url=http://downloads.openwrt.org/barrier_breaker/14.07/ramips/mt7620a/packages

echo "src/gz $release""_base $url/base" > /etc/opkg.conf
echo "src/gz $release""_luci $url/luci" >> /etc/opkg.conf
echo "src/gz $release""_management $url/management" >> /etc/opkg.conf
echo "src/gz $release""_oldpackages $url/oldpackages" >> /etc/opkg.conf
echo "src/gz $release""_packages $url/packages" >> /etc/opkg.conf
echo "src/gz $release""_routing $url/routing" >> /etc/opkg.conf
echo "src/gz $release""_telephony $url/telephony" >> /etc/opkg.conf

echo "dest root $ROOTDIR" >> /etc/opkg.conf
echo "dest ram /tmp" >> /etc/opkg.conf
echo "lists_dir ext $ROOTDIR/var/opkg-lists" >> /etc/opkg.conf
echo "option overlay_root $ROOTDIR" >> /etc/opkg.conf

opkg update


# wpa_supplicant
# --------------

echo "Install wpa_supplicant..."
opkg install wpad
opkg install wpa-cli

read -p "Enter your identity: " id
read -s -p "Enter your password: " psw
echo ""

config_file="/etc/wpa_supplicant.conf"
touch $config_file
echo "ctrl_interface=/var/run/wpa_supplicant" > $config_file
echo "ap_scan=0" >> $config_file
echo "network={" >> $config_file
echo "	key_mgmt=IEEE8021X" >> $config_file
echo "	eap=MD5" >> $config_file
echo "	identity=\"$id\"" >> $config_file
echo "	password=\"$psw\"" >> $config_file
echo "	eapol_flags=0" >> $config_file
echo "}" >> $config_file


# init script
# -----------

echo "Install init script..."
cp wpa /etc/init.d/
chmod 755 /etc/init.d/wpa
/etc/init.d/wpa enable

echo "Finished."
echo "Use command '/etc/init.d/wpa start' to start the service."
