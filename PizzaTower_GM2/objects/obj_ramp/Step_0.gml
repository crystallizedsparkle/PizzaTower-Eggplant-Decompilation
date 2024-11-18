var s, by, bx;

if (used)
    image_index = 1;
else
    image_index = 0;

s = 16;

if (place_meeting(x, y - s, obj_player))
{
    with (obj_player)
    {
        by = 4;
        
        if (state == UnknownEnum.Value_121)
            by = 10;
        
        bx = 8;
        
        if (state == UnknownEnum.Value_121 || state == UnknownEnum.Value_201)
            bx = 18;
        
        if ((state == UnknownEnum.Value_104 || state == UnknownEnum.Value_201 || state == UnknownEnum.Value_211 || state == UnknownEnum.Value_5 || state == UnknownEnum.Value_121 || state == UnknownEnum.Value_187) && y <= (other.y + by) && xscale == sign(other.image_xscale) && place_meeting(x, y + s, other))
        {
            vsp = -12;
            movespeed = 14;
            sprite_index = spr_player_rampjump;
            image_index = 0;
            
            if (isgustavo)
            {
                sprite_index = spr_player_ratmountwalljump;
                state = UnknownEnum.Value_203;
            }
            else
            {
                state = UnknownEnum.Value_187;
            }
            
            if (!other.used)
            {
                ramp = true;
                other.used = true;
            }
            
            ramp_buffer = 16;
            trace("trickjump");
        }
    }
}

enum UnknownEnum
{
    Value_5 = 5,
    Value_104 = 104,
    Value_121 = 121,
    Value_187 = 187,
    Value_201 = 201,
    Value_203 = 203,
    Value_211 = 211
}