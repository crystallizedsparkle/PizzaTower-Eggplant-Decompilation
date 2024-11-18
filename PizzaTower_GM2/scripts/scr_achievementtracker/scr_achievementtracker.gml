function add_achievement_update(argument0, argument1, argument2, argument3)
{
    var q;
    
    q = 
    {
        name: argument0,
        update_rate: argument1,
        frames: 0,
        update_func: -4,
        creation_code: -4,
        variables: ds_map_create(),
        unlocked: false
    };
    q.update_func = method(q, argument3);
    
    if (argument2 != -4)
    {
        q.creation_code = method(q, argument2);
        q.creation_code();
    }
    
    ds_list_add(obj_achievementtracker.achievements_update, q);
    return q;
}

function add_achievement_notify(argument0, argument1, argument2)
{
    var q;
    
    q = 
    {
        name: argument0,
        creation_code: -4,
        func: -4,
        unlocked: false,
        variables: ds_map_create()
    };
    q.func = method(q, argument2);
    
    if (argument1 != -4)
    {
        q.creation_code = method(q, argument1);
        q.creation_code();
    }
    
    ds_list_add(obj_achievementtracker.achievements_notify, q);
    return q;
}

function notification_push(argument0, argument1)
{
    with (obj_achievementtracker)
        ds_queue_enqueue(notify_queue, [argument0, argument1]);
}

function achievement_add_variable(argument0, argument1, argument2 = false)
{
    var q;
    
    q = 
    {
        init_value: argument1,
        value: argument1,
        save: argument2
    };
    ds_map_add(variables, argument0, q);
    return q;
}

function achievement_get_variable(argument0)
{
    return ds_map_find_value(variables, argument0);
}

function achievement_unlock(argument0, argument1, argument2)
{
    var b;
    
    b = achievement_get_struct(argument0);
    
    with (b)
    {
        unlocked = true;
        tv_push_prompt(argument1, UnknownEnum.Value_0, argument2, 2);
        quick_ini_write_real(get_savefile_ini(), "achievements", name, true);
        gamesave_async_save();
    }
    
    with (obj_achievementviewer)
        event_perform(ev_other, ev_room_start);
}

function achievement_save_variables(argument0)
{
    var i, b, size, key, q;
    
    for (i = 0; i < ds_list_size(argument0); i++)
    {
        b = ds_list_find_value(argument0, i);
        
        with (b)
        {
            size = ds_map_size(variables);
            key = ds_map_find_first(variables);
            
            for (i = 0; i < size; i++)
            {
                q = ds_map_find_value(variables, key);
                
                if (q.save)
                    quick_ini_write_real(get_savefile_ini(), "achievements_variables", key, q.value);
                
                key = ds_map_find_next(variables, key);
            }
        }
    }
}

function achievements_load(argument0)
{
    var i, b, size, key, q;
    
    for (i = 0; i < ds_list_size(argument0); i++)
    {
        b = ds_list_find_value(argument0, i);
        
        with (b)
        {
            unlocked = ini_read_real("achievements", name, false);
            size = ds_map_size(variables);
            key = ds_map_find_first(variables);
            
            for (i = 0; i < size; i++)
            {
                q = ds_map_find_value(variables, key);
                
                if (q.save)
                    q.value = ini_read_real("achievements_variables", key, q.init_value);
                
                key = ds_map_find_next(variables, key);
            }
        }
    }
}

function achievement_get_struct(argument0)
{
    var l, b, i, q;
    
    l = obj_achievementtracker.achievements_update;
    b = -4;
    
    for (i = 0; i < ds_list_size(l); i++)
    {
        q = ds_list_find_value(l, i);
        
        if (q.name == argument0)
        {
            b = q;
            break;
        }
    }
    
    if (b == -4)
    {
        l = obj_achievementtracker.achievements_notify;
        
        for (i = 0; i < ds_list_size(l); i++)
        {
            b = ds_list_find_value(l, i);
            
            if (q.name == argument0)
            {
                b = q;
                break;
            }
        }
    }
    
    return b;
}

enum UnknownEnum
{
    Value_0
}
