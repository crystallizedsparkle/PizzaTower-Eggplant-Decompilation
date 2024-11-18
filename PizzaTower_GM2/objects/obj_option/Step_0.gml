var _os_r, resolutionX, resolutionY;

if (!instance_exists(obj_keyconfig) && !instance_exists(obj_audioconfig))
    scr_getinput();

if (!instance_exists(obj_keyconfig) && !instance_exists(obj_audioconfig))
{
    if ((key_up2 || keyboard_check_pressed(vk_up)) && optionselected > 0)
    {
        optionselected -= 1;
        scr_soundeffect(41);
    }
    
    if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < 4)
    {
        optionselected += 1;
        scr_soundeffect(41);
    }
}

if (optionselected == 0)
{
    if ((key_right2 || keyboard_check_pressed(vk_right)) && optionsaved_fullscreen == 0)
        optionsaved_fullscreen = 1;
    
    if ((-key_left2 || keyboard_check_pressed(vk_left)) && optionsaved_fullscreen == 1)
        optionsaved_fullscreen = 0;
    
    if (key_jump || keyboard_check_pressed(vk_enter))
    {
        window_set_fullscreen(!optionsaved_fullscreen);
        ini_open("saveData.ini");
        global.option_fullscreen = !optionsaved_fullscreen;
        ini_write_real("Option", "fullscreen", !optionsaved_fullscreen);
        ini_close();
    }
}

if (optionselected == 1)
{
    if ((key_right2 || keyboard_check_pressed(vk_right)) && optionsaved_resolution < 2)
        optionsaved_resolution += 1;
    
    if ((-key_left2 || keyboard_check_pressed(vk_left)) && optionsaved_resolution > 0)
        optionsaved_resolution -= 1;
    
    if (key_jump || keyboard_check_pressed(vk_enter))
    {
        ini_open("saveData.ini");
        ini_write_real("Option", "resolution", optionsaved_resolution);
        ini_close();
        global.option_resolution = optionsaved_resolution;
        _os_r = optionsaved_resolution;
        resolutionX = (_os_r == 0) ? 480 : ((_os_r == 1) ? 960 : 1920);
        resolutionY = (_os_r == 0) ? 270 : ((_os_r == 1) ? 540 : 1080);
        window_set_size(resolutionX, resolutionY);
    }
}

if (optionselected == 2)
{
    if (!instance_exists(obj_keyconfig))
    {
        if ((key_jump || keyboard_check_pressed(vk_enter)) || keyboard_check_pressed(vk_enter))
        {
            visible = false;
            
            with (instance_create(x, y, obj_keyconfig))
                depth = other.depth - 1;
        }
    }
}

if (buffer > 0)
    buffer--;

if (optionselected == 3)
{
    if (buffer <= 0 && !instance_exists(obj_audioconfig))
    {
        if (key_jump || keyboard_check_pressed(vk_enter))
        {
            visible = false;
            
            with (instance_create(x, y, obj_audioconfig))
                depth = other.depth - 1;
        }
    }
}

if (optionselected == 4)
{
    if ((key_right2 || keyboard_check_pressed(vk_right)) && optionsaved_vibration == 0)
        optionsaved_vibration = 1;
    
    if ((-key_left2 || keyboard_check_pressed(vk_left)) && optionsaved_vibration == 1)
        optionsaved_vibration = 0;
    
    if (key_jump || keyboard_check_pressed(vk_enter))
    {
        ini_open("saveData.ini");
        global.option_vibration = !optionsaved_vibration;
        ini_write_real("Option", "vibration", !optionsaved_vibration);
        ini_close();
    }
}

if ((key_slap2 || keyboard_check_pressed(vk_escape)) && !instance_exists(obj_keyconfig) && !instance_exists(obj_audioconfig))
{
    scr_soundeffect(20);
    
    if (instance_exists(obj_mainmenuselect))
        obj_mainmenuselect.selected = false;
    
    instance_destroy();
}
