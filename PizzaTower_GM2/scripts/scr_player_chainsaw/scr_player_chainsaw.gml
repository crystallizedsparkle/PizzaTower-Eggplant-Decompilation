function scr_player_chainsaw()
{
    hsp = 0;
    vsp = 0;
    x = hitX + random_range(-4, 4);
    y = hitY + random_range(-4, 4);
    hitLag--;
    
    if (key_jump)
        input_buffer_jump = 0;
    
    if (key_slap2)
        input_buffer_slap = 0;
    
    image_speed = 0;
    
    if (key_slap2)
        input_attack_buffer = 8;
    
    if (hitLag <= 0)
    {
        x = hitX;
        y = hitY;
        movespeed = tauntstoredmovespeed;
        sprite_index = tauntstoredsprite;
        state = tauntstoredstate;
        vsp = tauntstoredvsp;
        
        if (global.attackstyle == 0)
        {
            if ((tauntstoredstate == UnknownEnum.Value_42 && (tauntstoredsprite == 771 || tauntstoredsprite == 768 || tauntstoredsprite == 2005 || tauntstoredsprite == 909)) || sprite_index == spr_piledriverland)
            {
                jumpAnim = true;
                state = UnknownEnum.Value_92;
                sprite_index = spr_suplexland;
                vsp = -11;
                jumpstop = false;
                image_index = 0;
            }
            else if (tauntstoredstate == UnknownEnum.Value_42 || tauntstoredstate == UnknownEnum.Value_6)
            {
                state = UnknownEnum.Value_0;
            }
        }
        
        if (global.attackstyle == 1)
        {
            if ((tauntstoredstate == UnknownEnum.Value_42 && (tauntstoredsprite == 771 || tauntstoredsprite == 768 || tauntstoredsprite == 2005 || tauntstoredsprite == 909)) || sprite_index == spr_piledriverland)
            {
                movespeed = 4;
                state = UnknownEnum.Value_91;
                sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch);
                image_index = 0;
                vsp = -5;
            }
            else if (tauntstoredstate == UnknownEnum.Value_42 || tauntstoredstate == UnknownEnum.Value_6)
            {
                movespeed = 4;
                state = UnknownEnum.Value_91;
                sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch);
                image_index = 0;
            }
        }
        
        if (global.attackstyle == 2)
        {
            if (tauntstoredstate == UnknownEnum.Value_43)
                state = UnknownEnum.Value_43;
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_6 = 6,
    Value_42 = 42,
    Value_43,
    Value_91 = 91,
    Value_92
}
