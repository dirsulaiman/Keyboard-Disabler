# Keyboard-Touchpad Disabler
Disable and enable internal keyboard

[!Guillef](https://ubuntu-mate.community/t/enable-disable-keyboard-or-laptop-touchpad-with-bash-scripts/15722)

### Installation 
Just download or glone with git and run 
```sh
$ git clone https://github.com/dirsulaiman/Keyboard-Disabler.git
$ 
```

### Manually Disable/Enable Keyboard-Touchpad
xinput list

disable
'xinput float $id' 

enable
'xinput reattach $id $master'

### License
Source file: [BSD License](https://github.com/dirsulaiman/Keyboard-Disabler/blob/master/LICENSE)