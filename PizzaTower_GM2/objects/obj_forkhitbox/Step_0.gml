if (!instance_exists(ID))
{
    instance_destroy();
    exit;
}

x = ID.x;
y = ID.y;
image_xscale = ID.image_xscale;
image_yscale = ID.image_yscale;

with (ID)
{
    if (object_index == obj_coolpineapple || object_index == obj_ghostknight || object_index == obj_forknight || object_index == obj_noisey || object_index == obj_smokingpizzaslice)
    {
        if (state != UnknownEnum.Value_134 && state != UnknownEnum.Value_125)
        {
            hitboxcreate = false;
            instance_destroy(other);
        }
    }
    
    switch (object_index)
    {
        case obj_pepperman:
            other.x = x + (image_xscale * 8);
            
            if (state != UnknownEnum.Value_153)
                instance_destroy(other);
            
            break;
        
        case obj_badrat:
            other.x = x + (image_xscale * 16);
            
            if (state != UnknownEnum.Value_80)
                instance_destroy(other);
            
            break;
        
        case obj_farmerbaddie:
        case obj_farmerbaddie2:
        case obj_farmerbaddie3:
            other.x = x + (image_xscale * 16);
            
            if (state != UnknownEnum.Value_80)
                instance_destroy(other);
            
            break;
        
        case obj_peppinoclone:
            other.x = x - (image_xscale * 10);
            
            if (state != UnknownEnum.Value_80)
                instance_destroy(other);
            
            break;
        
        case obj_motodude:
            other.x = x + (image_xscale * 32);
            break;
        
        case obj_robot:
            if (state != UnknownEnum.Value_104 && state != UnknownEnum.Value_23 && state != UnknownEnum.Value_91)
            {
                hitboxcreate = false;
                instance_destroy(other);
            }
            else if (state == UnknownEnum.Value_23)
            {
                other.x = x + (image_xscale * 32);
            }
            else if (state == UnknownEnum.Value_104 || state == UnknownEnum.Value_91)
            {
                other.x = x + (image_xscale * 20);
            }
            
            break;
        
        case obj_soldier:
            other.x = x + (image_xscale * 24);
            
            if (state != UnknownEnum.Value_125)
                instance_destroy(other);
            
            break;
        
        case obj_indiancheese:
            if (state != UnknownEnum.Value_134 && sprite_index != spr_indiancheese_howl)
            {
                hitboxcreate = false;
                instance_destroy(other);
            }
            
            break;
        
        case obj_thug_red:
        case obj_thug_blue:
        case obj_thug_green:
            if (state != UnknownEnum.Value_80)
            {
                instance_destroy(other);
                punchinst = -4;
            }
            
            break;
        
        case obj_weeniesquire:
            if (state != UnknownEnum.Value_80)
            {
                hitboxcreate = false;
                instance_destroy(other);
            }
            
            break;
        
        case obj_minijohn:
            if (state != UnknownEnum.Value_125 && state != UnknownEnum.Value_80)
                instance_destroy(other);
            
            break;
        
        case obj_ninja:
            if (state != UnknownEnum.Value_128 && state != UnknownEnum.Value_80)
                instance_destroy(other);
            
            if (state == UnknownEnum.Value_80)
            {
                if (image_index > 14)
                    instance_destroy(other);
                
                other.x = x + (image_xscale * 24);
            }
            
            break;
        
        case obj_boulder:
            if (!hitwall)
                instance_destroy(other);
            
            break;
        
        case obj_snickexe:
            if (obj_player1.instakillmove || obj_player1.state == UnknownEnum.Value_42)
            {
                instance_destroy(other);
                hitboxcreate = false;
            }
            
            break;
        
        case obj_pickle:
            if (state != UnknownEnum.Value_129)
                instance_destroy(other);
            
            break;
        
        case obj_peasanto:
        case obj_fencer:
        case obj_snowman:
        case obj_ancho:
            if (state != UnknownEnum.Value_128 && state != UnknownEnum.Value_125)
            {
                hitboxcreate = false;
                instance_destroy(other);
            }
            
            break;
    }
}

enum UnknownEnum
{
    Value_23 = 23,
    Value_42 = 42,
    Value_80 = 80,
    Value_91 = 91,
    Value_104 = 104,
    Value_125 = 125,
    Value_128 = 128,
    Value_129,
    Value_134 = 134,
    Value_153 = 153
}
