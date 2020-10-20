#!/bin/fish

set current_dir (pwd)
set icon_on (echo "$current_dir/icons/keyboard_on.png")
set icon_off (echo "$current_dir/icons/keyboard_off.png")

set run_xinput (xinput list | grep 'AT Translated Set 2 keyboard')

set keyboard_id (string match -r '=.+' $run_xinput | string match -r '\d+')
#echo $keyboard_id

set keyboard_status (string match -r -i '\[\w*' $run_xinput | string sub --start=2)
#echo $keyboard_status


function enable_keyboard
    set xinput (xinput list | grep 'Virtual core keyboard')
    set keyboard_master (string match -r '=.+' $xinput | string match -r '\d')
    xinput reattach $keyboard_id $keyboard_master
    echo 'Keyboard Enabled'
    notify-send -i $icon_on "Keyboard Enabled"
end

function disable_keyboard
    xinput float $keyboard_id
    echo 'Keyboard Disabled'
    notify-send -i $icon_off "Keyboard Disabled"
end


if test $keyboard_status = 'floating'
    enable_keyboard
else
    disable_keyboard
end

