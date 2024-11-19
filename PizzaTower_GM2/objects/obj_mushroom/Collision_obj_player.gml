if (other.cutscene == false && sprite_index != spr_bigmushroom_bounce && other.state != states.freefall && other.state != states.freefallprep && other.state != states.gotoplayer)
{
    other.jumpstop = true;
    
    with (other)
    {
        if (state == states.machslide)
        {
            state = states.jump;
            
            if (sprite_index == spr_mach3boost || sprite_index == spr_machslideboost)
                xscale *= -1;
        }
        
        if (state == states.normal)
            state = states.jump;
        
        if (state == states.climbwall)
            state = states.mach2;
    }
    
    sprite_index = spr_bigmushroom_bounce;
    
    if (other.state == states.jump || other.state == states.normal)
    {
        other.sprite_index = other.spr_machfreefall;
        other.image_index = 0;
    }
    
    image_index = 0;
    other.vsp = -14;
    other.jumpstop = true;
    
    if (other.isgustavo)
    {
        other.sprite_index = spr_player_ratmountmushroombounce;
        
        if (!other.brick)
            other.sprite_index = spr_lonegustavo_jumpstart;
        
        other.jumpAnim = true;
        other.state = states.ratmountjump;
        other.image_index = 0;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_37 = 37,
    Value_92 = 92,
    Value_104 = 104,
    Value_105,
    Value_108 = 108,
    Value_122 = 122,
    Value_186 = 186,
    Value_192 = 192
}
