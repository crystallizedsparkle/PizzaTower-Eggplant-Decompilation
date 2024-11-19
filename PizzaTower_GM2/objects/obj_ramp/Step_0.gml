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
        
        if (state == states.mach3)
            by = 10;
        
        bx = 8;
        
        if (state == states.mach3 || state == states.ratmounttumble)
            bx = 18;
        
        if ((state == states.mach2 || state == states.ratmounttumble || state == states.trashroll || state == states.tumble || state == states.mach3 || state == states.trickjump) && y <= (other.y + by) && xscale == sign(other.image_xscale) && place_meeting(x, y + s, other))
        {
            vsp = -12;
            movespeed = 14;
            sprite_index = spr_player_rampjump;
            image_index = 0;
            
            if (isgustavo)
            {
                sprite_index = spr_player_ratmountwalljump;
                state = states.ratmounttrickjump;
            }
            else
            {
                state = states.trickjump;
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
