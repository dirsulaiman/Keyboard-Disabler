# Keyboard-Disabler
Disable and enable Laptop internal keyboard

### Manually Disable/Enable Keyboard/Touchpad
xinput list

disable
'xinput float $id' 

enable
'xinput reattach $id $master'