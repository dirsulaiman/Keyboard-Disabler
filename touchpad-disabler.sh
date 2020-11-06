#!/bin/fish

set current_dir (pwd)
set icon_on (echo "$current_dir/icons/touchpad_on.png")
set icon_off (echo "$current_dir/icons/touchpad_off.png")

set run_xinput (xinput list | grep -i 'Touchpad')

set touchpad_id (string match -r '=.+' $run_xinput | string match -r '\d+')
#echo $touchpad_id

set touchpad_status (string match -r -i '\[\w*' $run_xinput | string sub --start=2)
#echo $touchpad_status

function enable_touchpad
    set xinput (xinput list | grep -i 'Virtual core pointer')
    set touchpad_master (string match -r '=.+' $xinput | string match -r '\d')
    xinput reattach $touchpad_id $touchpad_master
    echo 'Touchpad Enabled'
    notify-send -i $icon_on "Touchpad Enabled"
end

function disable_touchpad
    xinput float $touchpad_id
    echo 'Touchpad Disabled'
    notify-send -i $icon_off "Touchpad Disabled"
end

if test $touchpad_status = 'floating'
    enable_touchpad
else
    disable_touchpad
end

