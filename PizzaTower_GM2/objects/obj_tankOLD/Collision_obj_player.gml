var baddie, _xs;

baddie = id;

if (state != UnknownEnum.Value_141)
{
    with (other)
    {
        if (y < other.y && attacking == false && sprite_index != spr_player_mach2jump && ((state == UnknownEnum.Value_3 && vsp > 0) || state == UnknownEnum.Value_92 || state == UnknownEnum.Value_103 || state == UnknownEnum.Value_79) && vsp > 0 && other.vsp >= 0 && sprite_index != spr_stompprep)
        {
            scr_soundeffect(24);
            image_index = 0;
            
            if (key_jump2)
            {
                instance_create(x, y + 50, obj_stompeffect);
                stompAnim = true;
                vsp = -14;
                
                if (state == UnknownEnum.Value_92)
                    sprite_index = spr_stompprep;
            }
            else
            {
                instance_create(x, y + 50, obj_stompeffect);
                stompAnim = true;
                vsp = -9;
                
                if (state == UnknownEnum.Value_92)
                    sprite_index = spr_stompprep;
            }
        }
        
        if (y >= other.y && other.thrown == false && other.stuntouchbuffer == 0 && other.vsp > 0 && state != UnknownEnum.Value_106 && other.state != UnknownEnum.Value_141)
        {
            scr_soundeffect(28);
            
            if (state != UnknownEnum.Value_51 && state != UnknownEnum.Value_103 && state != UnknownEnum.Value_102)
                movespeed = 0;
            
            _xs = sign(x - baddie.x);
            
            if (floor(_xs) == 0)
                _xs = xscale;
            
            hsp = 3 * _xs;
            state = UnknownEnum.Value_106;
            xscale = -_xs;
            sprite_index = spr_bump;
            vsp = -4;
        }
    }
}
else
{
    with (other)
    {
        if (state != UnknownEnum.Value_59)
        {
            state = UnknownEnum.Value_59;
            sprite_index = spr_squished;
            image_index = 0;
            scr_losepoints();
        }
    }
}

enum UnknownEnum
{
    Value_3 = 3,
    Value_51 = 51,
    Value_59 = 59,
    Value_79 = 79,
    Value_92 = 92,
    Value_102 = 102,
    Value_103,
    Value_106 = 106,
    Value_141 = 141
}
