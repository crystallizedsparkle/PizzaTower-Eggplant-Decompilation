function scr_player_ratmountclimbwall()
{
    if (wallspeed < 0)
        image_speed = 0.1;
    
    hsp = 0;
    vsp = 0;
    
    if (sprite_index != spr_player_ratmountbounceside)
    {
        sprite_index = spr_player_ratmountbounceside;
        image_index = 0;
    }
    else if (floor(image_index) == (image_number - 1))
    {
        image_index = image_number - 1;
    }
    
    if (!grounded && !place_meeting(x + 1, y, obj_solid) && !place_meeting(x - 1, y, obj_solid))
    {
        state = UnknownEnum.Value_192;
        jumpAnim = false;
        sprite_index = spr_player_ratmountfall;
    }
    
    if (floor(image_index) == (image_number - 1))
    {
        if (key_jump2)
        {
            state = UnknownEnum.Value_198;
            xscale *= -1;
            vsp = -14;
            ratmount_fallingspeed = 0;
            movespeed = xscale * 10;
            sprite_index = spr_player_ratmountwalljump;
        }
        else
        {
            state = UnknownEnum.Value_192;
            sprite_index = spr_player_ratmountfall;
        }
    }
}

enum UnknownEnum
{
    Value_192 = 192,
    Value_198 = 198
}
