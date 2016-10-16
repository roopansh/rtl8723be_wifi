#!/bin/bash
sudo modprobe -r rtl8723be
echo "Removing rtl8723be module form the kernel"
echo "Entering /etc/modprobe.d/"
echo "Changing the rtl8723be settings" 
echo "options rtl8723be fwlps=N ips=N ant_sel=1" | sudo tee /etc/modprobe.d/rtl8723be.conf
echo "Adding rtl8723be module back to the kernel"
sudo modprobe rtl8723be