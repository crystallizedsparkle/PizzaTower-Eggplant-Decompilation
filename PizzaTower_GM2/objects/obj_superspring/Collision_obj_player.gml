with (other)
{
    if (state != UnknownEnum.Value_97 && state != UnknownEnum.Value_186 && state != UnknownEnum.Value_146)
    {
        if (state == UnknownEnum.Value_47 || state == UnknownEnum.Value_48 || state == UnknownEnum.Value_38)
        {
            with (instance_create(x, y, obj_knightdebris))
                image_index = 0;
            
            with (instance_create(x, y, obj_knightdebris))
                image_index = 1;
            
            with (instance_create(x, y, obj_knightdebris))
                image_index = 2;
            
            with (instance_create(x, y, obj_knightdebris))
                image_index = 3;
            
            with (instance_create(x, y, obj_knightdebris))
                image_index = 4;
            
            with (instance_create(x, y, obj_knightdebris))
                image_index = 5;
        }
        
        if (state == UnknownEnum.Value_51)
            instance_create(x, y, obj_bombexplosion);
        
        x = other.x;
        instance_create(x, y - 20, obj_bangeffect);
        
        if (other.image_yscale == 1)
        {
            sprite_index = spr_superspringplayer;
            state = UnknownEnum.Value_97;
            vsp = -10;
        }
        else
        {
            state = UnknownEnum.Value_108;
            vsp = 10;
            sprite_index = spr_player_rockethitwall;
        }
        
        other.image_index = 0;
        other.sprite_index = spr_presentbox_activate;
    }
}

enum UnknownEnum
{
    Value_38 = 38,
    Value_47 = 47,
    Value_48,
    Value_51 = 51,
    Value_97 = 97,
    Value_108 = 108,
    Value_146 = 146,
    Value_186 = 186
}
