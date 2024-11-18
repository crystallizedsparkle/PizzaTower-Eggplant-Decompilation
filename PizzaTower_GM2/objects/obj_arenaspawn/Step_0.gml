var i, b, _doorfinish;

switch (state)
{
    case UnknownEnum.Value_0:
        if (obj_player1.x <= x)
        {
            state = UnknownEnum.Value_145;
            round_count = 10;
            
            with (obj_arenagate)
            {
                sprite_index = spr_arenagate_close;
                image_index = 0;
                block_inst = instance_create(x, y, obj_solid);
                
                with (block_inst)
                {
                    sprite_index = spr_arenagate_open;
                    image_xscale = other.image_xscale;
                    image_yscale = other.image_yscale;
                }
            }
        }
        
        break;
    
    case UnknownEnum.Value_144:
        with (obj_player)
            state = UnknownEnum.Value_46;
        
        if (cutscene_count > 0)
        {
            cutscene_count--;
        }
        else
        {
            with (obj_player)
            {
                state = UnknownEnum.Value_0;
                image_index = 0;
            }
            
            state = UnknownEnum.Value_145;
            round_count = 10;
        }
        
        break;
    
    case UnknownEnum.Value_145:
        if (round_count > 0)
            round_count--;
        else
            state = UnknownEnum.Value_142;
        
        break;
    
    case UnknownEnum.Value_142:
        if (!ds_list_empty(baddielist))
        {
            for (i = 0; i < ds_list_size(baddielist); i++)
            {
                b = ds_list_find_value(baddielist, i);
                
                if (b[0] == wave)
                {
                    instance_activate_object(b[1]);
                    
                    if (instance_exists(b[1]))
                    {
                        with (instance_create(b[1].x, b[1].y, obj_arena_pizzaportal))
                        {
                            stored_id = b[1];
                            alarm[0] = other.round_max;
                        }
                        
                        instance_deactivate_object(b[1]);
                    }
                }
                else
                {
                    instance_deactivate_object(b[1]);
                }
            }
        }
        
        wave_minutes = minutes;
        wave_seconds = seconds;
        round_count = round_max;
        state = UnknownEnum.Value_143;
        
        with (obj_arenadoor)
        {
            wave = other.wave;
            alarm[0] = 10;
            finish = false;
            
            if (objectlist[wave] == -4)
            {
                alarm[0] = -1;
                finish = true;
            }
        }
        
        break;
    
    case UnknownEnum.Value_143:
        _doorfinish = true;
        
        with (obj_arenadoor)
        {
            if (!finish)
                _doorfinish = false;
        }
        
        if (!instance_exists(obj_baddie) && !instance_exists(obj_arena_pizzaportal) && (!instance_exists(obj_arenadoor) || _doorfinish))
        {
            wave++;
            
            if (wave > maxwave)
            {
                instance_destroy();
                instance_destroy(block_inst);
                
                with (obj_arenagate)
                {
                    image_index = 0;
                    sprite_index = spr_arenagate_open;
                    instance_destroy(block_inst);
                }
                
                cutscene_count = outro_max;
                
                with (obj_player)
                {
                    with (obj_music)
                        arena = false;
                }
            }
            else
            {
                state = UnknownEnum.Value_142;
                round_count = round_max;
            }
        }
        
        break;
    
    case UnknownEnum.Value_8:
        if (floor(image_index) == (image_number - 1))
            state = UnknownEnum.Value_98;
        
        break;
    
    case UnknownEnum.Value_98:
        instance_destroy();
        break;
}

if (state != UnknownEnum.Value_0 && state != UnknownEnum.Value_144)
    visible = false;

enum UnknownEnum
{
    Value_0,
    Value_8 = 8,
    Value_46 = 46,
    Value_98 = 98,
    Value_142 = 142,
    Value_143,
    Value_144,
    Value_145
}