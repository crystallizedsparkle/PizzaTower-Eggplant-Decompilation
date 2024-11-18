with (other)
{
    if (state != UnknownEnum.Value_265)
    {
        state = UnknownEnum.Value_265;
        vsp = 0;
        scr_soundeffect(149);
        
        with (obj_antigravbubble)
        {
            if (playerid == other.id)
                instance_destroy();
        }
        
        with (instance_create(x, y, obj_antigravbubble))
            playerid = other.id;
        
        other.image_index = 0;
        other.sprite_index = spr_antigrav_activate;
    }
}

enum UnknownEnum
{
    Value_265 = 265
}
