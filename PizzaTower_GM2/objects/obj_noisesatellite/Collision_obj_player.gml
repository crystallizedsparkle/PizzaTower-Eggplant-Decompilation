if (state != UnknownEnum.Value_4)
{
    with (obj_player)
    {
        if (y < other.y && attacking == false && state == UnknownEnum.Value_92 && vsp > 0)
        {
            if (vsp > 0)
            {
                other.hp = 0;
                other.stunned = 200;
                
                if (x != other.x)
                    other.image_xscale = -sign(other.x - x);
                
                image_index = 0;
                
                if (key_jump2)
                {
                    other.vsp = -5;
                    other.hsp = -other.image_xscale * 3;
                    instance_create(x, y + 50, obj_stompeffect);
                    other.state = UnknownEnum.Value_138;
                    stompAnim = true;
                    other.image_index = 0;
                    vsp = -14;
                    sprite_index = spr_player_stompprep;
                }
                else
                {
                    other.vsp = -5;
                    other.hsp = -other.image_xscale * 3;
                    instance_create(x, y + 50, obj_stompeffect);
                    other.state = UnknownEnum.Value_138;
                    stompAnim = true;
                    other.image_index = 0;
                    vsp = -9;
                    sprite_index = spr_player_stompprep;
                }
            }
        }
        
        if (state == UnknownEnum.Value_103)
        {
            instance_create(x, y, obj_bumpeffect);
            other.stunned = 40;
            
            if (x != other.x)
                other.image_xscale = -sign(other.x - x);
            
            other.vsp = -5;
            other.hsp = -other.image_xscale * 3;
            hsp = -xscale * 4;
            vsp = -4;
            machpunchAnim = true;
            
            if (x != other.x)
                other.image_xscale = -sign(other.x - x);
            
            other.state = UnknownEnum.Value_138;
            image_index = 0;
            state = UnknownEnum.Value_91;
        }
        
        if (state == UnknownEnum.Value_104 && other.grounded == true)
        {
            other.hp = 0;
            instance_create(x, y, obj_bumpeffect);
            other.vsp = -10;
            other.hsp = xscale;
            other.image_index = 0;
            other.stunned = 200;
            other.state = UnknownEnum.Value_138;
            machpunchAnim = true;
            
            if (!scr_solid(x, y + 1) && state != UnknownEnum.Value_108)
                vsp = -10;
        }
        
        if (attacking == true && state != UnknownEnum.Value_104)
        {
            if (state == UnknownEnum.Value_121)
                other.shot = true;
            
            image_index = 0;
            instance_destroy(other);
            machpunchAnim = true;
            
            if (!scr_solid(x, y + 1) && state != UnknownEnum.Value_108)
                vsp = -10;
        }
        
        if (attacking == false && (state != UnknownEnum.Value_91 && state != UnknownEnum.Value_107) && !(y < other.y) && grabbing == false && other.state != UnknownEnum.Value_138)
        {
            if (x != other.x)
            {
                other.image_xscale = -sign(other.x - x);
                xscale = -sign(x - other.x);
            }
            
            hsp = -xscale * 4;
            vsp = -4;
            other.image_xscale = -xscale;
            other.hsp = -other.image_xscale * 4;
            other.vsp = -4;
            
            if (other.state == UnknownEnum.Value_134 || other.state == UnknownEnum.Value_130)
                other.state = UnknownEnum.Value_126;
            
            image_index = 0;
            state = UnknownEnum.Value_106;
            
            if (other.state == UnknownEnum.Value_136)
                other.state = UnknownEnum.Value_126;
        }
    }
}

enum UnknownEnum
{
    Value_4 = 4,
    Value_91 = 91,
    Value_92,
    Value_103 = 103,
    Value_104,
    Value_106 = 106,
    Value_107,
    Value_108,
    Value_121 = 121,
    Value_126 = 126,
    Value_130 = 130,
    Value_134 = 134,
    Value_136 = 136,
    Value_138 = 138
}
