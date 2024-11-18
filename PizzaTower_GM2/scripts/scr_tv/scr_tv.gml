function tv_set_idle()
{
    with (obj_tv)
    {
        state = UnknownEnum.Value_0;
        sprite_index = spr_tv_idle;
    }
}

function tv_reset()
{
    with (obj_tv)
    {
        state = UnknownEnum.Value_0;
        sprite_index = spr_tv_idle;
        ds_list_clear(tvprompts_list);
    }
}

function tv_create_prompt(argument0, argument1, argument2, argument3)
{
    return [argument0, argument1, argument2, argument3];
}

function tv_push_prompt(argument0, argument1, argument2, argument3)
{
    var b, play, placed, i, b2;
    
    with (obj_tv)
    {
        b = [argument0, argument1, argument2, argument3];
        play = false;
        
        switch (argument1)
        {
            case UnknownEnum.Value_0:
                play = true;
                ds_list_insert(tvprompts_list, 0, b);
                break;
            
            case UnknownEnum.Value_1:
                placed = false;
                
                for (i = 0; i < ds_list_size(tvprompts_list); i++)
                {
                    b2 = ds_list_find_value(tvprompts_list, i);
                    
                    if (b2[1] == UnknownEnum.Value_2)
                    {
                        if (i == 0)
                            play = true;
                        
                        ds_list_insert(tvprompts_list, i, b);
                        placed = true;
                        break;
                    }
                }
                
                if (!placed)
                    ds_list_add(tvprompts_list, b);
                
                break;
            
            case UnknownEnum.Value_2:
                ds_list_add(tvprompts_list, b);
                break;
        }
        
        if (play)
            state = UnknownEnum.Value_0;
    }
}

function tv_push_prompt_array(argument0)
{
    var i, b;
    
    for (i = 0; i < array_length(argument0); i++)
    {
        with (obj_tv)
        {
            b = argument0[i];
            tv_push_prompt(b[0], b[1], b[2], b[3]);
        }
    }
}

function tv_push_prompt_once(argument0, argument1)
{
    var b;
    
    with (obj_tv)
    {
        if (special_prompts == -4)
            return false;
        
        b = ds_map_find_value(special_prompts, argument1);
        
        if (is_undefined(b))
            return false;
        
        if (b != 1)
        {
            tv_push_prompt(argument0[0], argument0[1], argument0[2], argument0[3]);
            ds_map_set(special_prompts, argument1, 1);
            ini_open_from_string(obj_savesystem.ini_str);
            ini_write_real("Prompts", argument1, 1);
            obj_savesystem.ini_str = ini_close();
            return true;
        }
        
        return false;
    }
}

function tv_default_condition()
{
    return place_meeting(x, y, obj_player);
}

function tv_do_expression(argument0)
{
    with (obj_tv)
    {
        if (expressionsprite != argument0 && bubblespr == -4)
        {
            state = UnknownEnum.Value_250;
            expressionsprite = argument0;
            sprite_index = spr_tv_whitenoise;
            
            switch (expressionsprite)
            {
                case 1319:
                case 1497:
                    expressionbuffer = 60;
                    break;
                
                case 731:
                    expressionbuffer = 150;
                    
                    if (obj_player.isgustavo)
                        expressionsprite = 263;
                    
                    break;
            }
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_250 = 250
}