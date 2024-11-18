var _pindex, _dvc, p;

if (!global.option_vibration)
    exit;

with (obj_player)
{
    _pindex = (object_index == obj_player1) ? 0 : 1;
    _dvc = other.player_input_device[_pindex];
    
    if (state != other.prevstate[_pindex])
    {
        switch (state)
        {
            case UnknownEnum.Value_91:
                GamepadSetVibration(_pindex, 0.8, 0.8, 0.6);
                break;
            
            case UnknownEnum.Value_5:
                GamepadSetVibration(_pindex, 0.8, 0.8, 0.8);
                break;
            
            case UnknownEnum.Value_9:
                GamepadSetVibration(_pindex, 1, 1, 0.85);
                break;
            
            case UnknownEnum.Value_10:
                GamepadSetVibration(_pindex, 0.8, 0.8, 0.85);
                break;
            
            case UnknownEnum.Value_107:
                GamepadSetVibration(_pindex, 1, 1, 0.85);
                break;
            
            case UnknownEnum.Value_51:
                GamepadSetVibration(_pindex, 0.8, 0.8, 0.6);
                
                if (sprite_index == spr_bombpepend)
                    GamepadSetVibration(_pindex, 1, 1, 0.9);
                
                break;
            
            case UnknownEnum.Value_97:
                GamepadSetVibration(_pindex, 0.8, 0.8, 0.85);
                break;
            
            case UnknownEnum.Value_99:
                GamepadSetVibration(_pindex, 0.8, 0.8, 0.6);
                break;
            
            case UnknownEnum.Value_123:
                GamepadSetVibration(_pindex, 1, 1, 0.9);
                break;
            
            case UnknownEnum.Value_47:
                if (sprite_index == spr_knightpepthunder)
                    GamepadSetVibration(_pindex, 1, 1, 0.9);
                
                break;
            
            case UnknownEnum.Value_147:
                GamepadSetVibration(_pindex, 0.8, 0.8, 0.65);
                break;
            
            case UnknownEnum.Value_111:
                GamepadSetVibration(_pindex, 1, 1, 0.85);
                break;
            
            case UnknownEnum.Value_61:
                GamepadSetVibration(_pindex, 0.8, 0.8, 0.6);
                break;
            
            case UnknownEnum.Value_106:
                if (sprite_index != spr_hitwall)
                    GamepadSetVibration(_pindex, 0.8, 0.8, 0.6);
                else
                    GamepadSetVibration(_pindex, 1, 1, 0.85);
                
                break;
            
            case UnknownEnum.Value_79:
                GamepadSetVibration(_pindex, 0.2, 0.2, 0.8);
                break;
            
            default:
                other.setVibration(_pindex, 0, 0);
                break;
        }
        
        other.prevstate[_pindex] = state;
    }
}

for (p = 0; p < array_length(vibration); p++)
{
    _dvc = player_input_device[p];
    vibration[p][0] *= vibration[p][2];
    vibration[p][1] *= vibration[p][2];
    
    if (vibration[p][0] < 0)
        vibration[p][0] = 0;
    
    if (vibration[p][1] < 0)
        vibration[p][1] = 0;
    
    gamepad_set_vibration(_dvc, vibration[p][0], vibration[p][1]);
}

enum UnknownEnum
{
    Value_5 = 5,
    Value_9 = 9,
    Value_10,
    Value_47 = 47,
    Value_51 = 51,
    Value_61 = 61,
    Value_79 = 79,
    Value_91 = 91,
    Value_97 = 97,
    Value_99 = 99,
    Value_106 = 106,
    Value_107,
    Value_111 = 111,
    Value_123 = 123,
    Value_147 = 147
}
