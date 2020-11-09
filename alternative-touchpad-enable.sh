#!/bin/fish

set current_dir (pwd)
set icon_on (echo "$current_dir/icons/touchpad_on.png")
set icon_off (echo "$current_dir/icons/touchpad_off.png")

set run_xinput (xinput list | grep -i 'Touchpad')

set touchpad_id (string match -r '=.+' $run_xinput | string match -r '\d+')
#echo $touchpad_id

function enable_touchpad
    xinput set-prop $touchpad_id "Device Enabled" 1
    echo 'Touchpad Enabled'
    notify-send -i $icon_on "Touchpad Enabled"
end

function disable_touchpad
    xinput set-prop $touchpad_id "Device Enabled" 0
    echo 'Touchpad Disabled'
    notify-send -i $icon_off "Touchpad Disabled"
end

enable_touchpad

