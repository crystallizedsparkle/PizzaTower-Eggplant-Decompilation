if (other.cutscene == false && sprite_index != spr_bigmushroom_bounce && other.state != UnknownEnum.Value_108 && other.state != UnknownEnum.Value_122 && other.state != UnknownEnum.Value_186)
{
    other.jumpstop = true;
    
    with (other)
    {
        if (state == UnknownEnum.Value_105)
        {
            state = UnknownEnum.Value_92;
            
            if (sprite_index == spr_mach3boost || sprite_index == spr_machslideboost)
                xscale *= -1;
        }
        
        if (state == UnknownEnum.Value_0)
            state = UnknownEnum.Value_92;
        
        if (state == UnknownEnum.Value_37)
            state = UnknownEnum.Value_104;
    }
    
    sprite_index = spr_bigmushroom_bounce;
    
    if (other.state == UnknownEnum.Value_92 || other.state == UnknownEnum.Value_0)
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
        other.state = UnknownEnum.Value_192;
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
