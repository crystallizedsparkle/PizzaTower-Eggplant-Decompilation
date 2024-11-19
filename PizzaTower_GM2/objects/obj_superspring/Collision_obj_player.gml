with (other)
{
    if (state != states.Sjump && state != states.gotoplayer && state != states.actor)
    {
        if (state == states.knightpep || state == states.knightpepattack || state == states.knightpepslopes)
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
        
        if (state == states.bombpep)
            instance_create(x, y, obj_bombexplosion);
        
        x = other.x;
        instance_create(x, y - 20, obj_bangeffect);
        
        if (other.image_yscale == 1)
        {
            sprite_index = spr_superspringplayer;
            state = states.Sjump;
            vsp = -10;
        }
        else
        {
            state = states.freefall;
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
