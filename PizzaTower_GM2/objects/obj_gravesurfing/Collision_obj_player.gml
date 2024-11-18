if (buffer <= 0 && other.state != UnknownEnum.Value_16 && other.grounded)
{
    buffer = 50;
    
    with (other)
    {
        vsp = -11;
        movespeed = abs(movespeed);
        dir = xscale;
        movespeed = 13;
        instance_create(x, y, obj_jumpdust);
        sprite_index = spr_player_corpsestart;
        image_index = 0;
        
        with (obj_gravecorpse)
        {
            if (playerid == other.id)
                instance_destroy();
        }
        
        with (instance_create(x, y, obj_gravecorpse))
            playerid = other.id;
        
        state = UnknownEnum.Value_211;
    }
}

enum UnknownEnum
{
    Value_16 = 16,
    Value_211 = 211
}