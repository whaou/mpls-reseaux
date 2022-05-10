
# Installation des logiciels

**Note:** Dans les VM, le mot de passe utilisateur est `usr`.

## Filius

``` shell
wget https://www.lernsoftware-filius.de/downloads/Setup/filius_1.13.2_all.deb
sudo apt update
sudo apt install -y ./filius_1.13.2_all.deb
sudo apt install -y default-jdk

```

## Chromium

``` shell
sudo ls

sudo apt install -y net-tools curl minicom wireshark
sudo usermod -a -G wireshark $USER

# CHROME
snap refresh chromium --channel=candidate/raw-usb 
snap connect chromium:raw-usb

# Create rule
sudo cat << EOF >> /etc/udev/rules.d/50-microbit.rules
SUBSYSTEM=="usb", ATTR{idVendor}=="0d28", MODE="0664", GROUP="plugdev"
EOF

# Add current user to plugdev group
sudo usermod -a -G plugdev $USER

# Reload udev rules
sudo udevadm control --reload-rules

```



--8<-- "includes/abbreviations.md"