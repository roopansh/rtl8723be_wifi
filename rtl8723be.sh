#!/bin/bash
if [ $EUID -ne 0 ]; then
	echo "Please run as root"
	exit
fi
echo "Removing rtl8723be module form the kernel"
modprobe -r rtl8723be
if [ "$?" = "0" ]; then
	echo "Entering /etc/modprobe.d/"
	echo "Changing the rtl8723be settings"
	echo "options rtl8723be fwlps=N ips=N ant_sel=1" | sudo tee /etc/modprobe.d/rtl8723be.conf
	if [ "$?" = "0" ]; then
		echo "Adding rtl8723be module back to the kernel"
		echo "Return status 0"
	else
		echo "There were errors editing the module options"
		echo "Process returned with some errors"
		modprobe rtl8723be
		return 1
	fi
else
	echo "There were errors removing the Module from the kernel"
	echo "Process returned with some errors"
	return 1
fi
modprobe rtl8723be