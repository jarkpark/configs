# Custom Functions
# Author: James Park

togglewifi () {
	WIFIPORT=$(networksetup -listallhardwareports | grep -A 1 Wi-Fi | tail -n 1 | awk '{print $2}')
	echo "Wi-Fi adapter port number: $WIFIPORT"
	networksetup -setairportpower $WIFIPORT off
	networksetup -setairportpower $WIFIPORT on
	echo "Toggled off then on!"
}

