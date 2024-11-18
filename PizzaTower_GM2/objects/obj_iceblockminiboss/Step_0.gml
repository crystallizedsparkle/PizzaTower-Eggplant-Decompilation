if (visible == true && obj_player.state != UnknownEnum.Value_7)
{
    if (place_meeting(x, y - 1, obj_player1))
    {
        with (obj_player1)
        {
            if (state == UnknownEnum.Value_47)
            {
                state = UnknownEnum.Value_38;
            }
            else if (state != UnknownEnum.Value_38)
            {
                state = UnknownEnum.Value_94;
                sprite_index = spr_slipnslide;
            }
            
            if (movespeed < 12)
                movespeed = 12;
        }
    }
    
    if (place_meeting(x, y - 1, obj_player2))
    {
        with (obj_player2)
        {
            if (state == UnknownEnum.Value_47)
            {
                state = UnknownEnum.Value_38;
            }
            else if (state != UnknownEnum.Value_38)
            {
                state = UnknownEnum.Value_94;
                sprite_index = spr_slipnslide;
            }
            
            if (movespeed < 12)
                movespeed = 12;
        }
    }
}

if (visible == false && global.boxhp <= 5)
{
    x = xstart;
    y = ystart;
    visible = true;
    
    repeat (4)
        instance_create(x, y, obj_debris);
    
    if (!audio_is_playing(sfx_breakblock1))
        scr_soundeffect(15);
    
    mask_index = sprite_index;
}

enum UnknownEnum
{
    Value_7 = 7,
    Value_38 = 38,
    Value_47 = 47,
    Value_94 = 94
}
