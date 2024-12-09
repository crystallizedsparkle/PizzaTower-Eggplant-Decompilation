function scr_button_pressed(_device)
{
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(global.key_jump) || keyboard_check_pressed(global.key_jumpN))
    {
        return -1;
    }
    else if (gamepad_is_connected(_device))
    {
        if (gamepad_button_check(_device, gp_face1) || gamepad_button_check(_device, gp_start))
            return _device;
    }
    
    return -2;
}
