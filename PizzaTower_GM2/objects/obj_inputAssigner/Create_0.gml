player_input_device[0] = -2;
player_input_device[1] = -2;
device_selected[0] = false;
device_selected[1] = false;
press_start = false;
deactivated = false;
device_to_reconnect = 0;
prevstate[0] = states.titlescreen;
prevstate[1] = states.titlescreen;
vibration[0][0] = 0;
vibration[0][1] = 0;
vibration[0][2] = 0;
vibration[1][0] = 0;
vibration[1][1] = 0;
vibration[1][2] = 0;

setVibration = function(_vibration_index, _vibration1, _vibration2, _vibration3)
{
    vibration[_vibration_index][0] = _vibration1;
    vibration[_vibration_index][1] = _vibration2;
    
    if (_vibration3 != undefined)
        vibration[_vibration_index][2] = _vibration3;
};

function CheckUsedIndex(_val)
{
    for (var _x = 0; _x < 2; _x++)
    {
        if (player_input_device[_x] == _val)
            return true;
    }
    
    return false;
}

