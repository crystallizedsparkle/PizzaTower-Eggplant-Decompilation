function scr_ratblock_destroy()
{
    with (obj_player)
    {
        if ((other.sprite_index == spr_rattumbleblock || other.sprite_index == spr_rattumbleblock_big) && sprite_index == spr_tumble && (place_meeting(x + 1, y, other) || place_meeting(x - 1, y, other)))
            instance_destroy(other);
        
        if (state != UnknownEnum.Value_11 && state != UnknownEnum.Value_52 && (!scr_transformationcheck() || state == UnknownEnum.Value_113) && (place_meeting(x + 1, y, other) || place_meeting(x - 1, y, other) || place_meeting(x, y + 1, other) || place_meeting(x, y - 1, other)))
        {
            switch (state)
            {
                case UnknownEnum.Value_113:
                    if (!place_meeting(x, y - 12, other))
                        instance_destroy(other);
                    
                    break;
                
                case UnknownEnum.Value_51:
                    if (sprite_index != spr_bombpepend && sprite_index != spr_bombpepintro)
                    {
                        instance_create(x, y, obj_bombexplosion);
                        instance_destroy(other);
                        GamepadSetVibration(0, 1, 1, 0.9);
                        hurted = true;
                        vsp = -4;
                        image_index = 0;
                        sprite_index = spr_bombpepend;
                        state = UnknownEnum.Value_51;
                        bombpeptimer = 0;
                    }
                    
                    break;
                
                case UnknownEnum.Value_186:
                case UnknownEnum.Value_150:
                case UnknownEnum.Value_146:
                case UnknownEnum.Value_33:
                case UnknownEnum.Value_34:
                case UnknownEnum.Value_35:
                case UnknownEnum.Value_47:
                case UnknownEnum.Value_49:
                    break;
                
                case UnknownEnum.Value_5:
                    if (other.sprite_index == spr_rattumbleblock || other.sprite_index == spr_rattumbleblock_big)
                        instance_destroy(other);
                    
                    break;
                
                default:
                    if (other.sprite_index != spr_rattumbleblock && other.sprite_index != spr_rattumbleblock_big)
                        instance_destroy(other);
            }
        }
    }
}

enum UnknownEnum
{
    Value_5 = 5,
    Value_11 = 11,
    Value_33 = 33,
    Value_34,
    Value_35,
    Value_47 = 47,
    Value_49 = 49,
    Value_51 = 51,
    Value_52,
    Value_113 = 113,
    Value_146 = 146,
    Value_150 = 150,
    Value_186 = 186
}
