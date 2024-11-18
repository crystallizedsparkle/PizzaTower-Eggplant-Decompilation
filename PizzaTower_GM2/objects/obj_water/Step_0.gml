if (place_meeting(x, y - 1, obj_player))
{
    with (obj_player)
    {
        if (state != UnknownEnum.Value_186 && state != UnknownEnum.Value_210 && state != UnknownEnum.Value_209 && state != UnknownEnum.Value_121 && state != UnknownEnum.Value_147 && sprite_index != spr_mach3boost)
        {
            if (place_meeting(x, y + 1, other))
            {
                if (state != UnknownEnum.Value_211)
                {
                    scr_losepoints();
                    image_index = 0;
                    state = UnknownEnum.Value_9;
                    movespeed = hsp;
                    vsp = -14;
                    instance_create(x, y + 20, obj_piranneapplewater);
                    sprite_index = spr_scaredjump1;
                    
                    with (instance_create(x, y, obj_superdashcloud))
                        sprite_index = spr_watereffect;
                }
                else
                {
                    vsp = -6;
                    sprite_index = spr_player_jumpdive1;
                    image_index = 0;
                }
            }
        }
    }
}

with (instance_place(x, y - 1, obj_baddie))
    instance_destroy();

enum UnknownEnum
{
    Value_9 = 9,
    Value_121 = 121,
    Value_147 = 147,
    Value_186 = 186,
    Value_209 = 209,
    Value_210,
    Value_211
}