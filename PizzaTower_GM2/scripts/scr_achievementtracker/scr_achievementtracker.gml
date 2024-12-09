function add_achievement_update(_name, _update_rate, _func1, _func2)
{
    var q = 
    {
        name: _name,
        update_rate: _update_rate,
        frames: 0,
        update_func: noone,
        creation_code: noone,
        variables: ds_map_create(),
        unlocked: false
    };
    q.update_func = method(q, _func2);
    
    if (_func1 != noone)
    {
        q.creation_code = method(q, _func1);
        q.creation_code();
    }
    
    ds_list_add(obj_achievementtracker.achievements_update, q);
    return q;
}

function add_achievement_notify(_name, _func1, _func2)
{
    var q = 
    {
        name: _name,
        creation_code: noone,
        func: noone,
        unlocked: false,
        variables: ds_map_create()
    };
    q.func = method(q, _func2);
    
    if (_func1 != noone)
    {
        q.creation_code = method(q, _func1);
        q.creation_code();
    }
    
    ds_list_add(obj_achievementtracker.achievements_notify, q);
    return q;
}

function notification_push(_notification_type, _notification_data)
{
    with (obj_achievementtracker)
        ds_queue_enqueue(notify_queue, [_notification_type, _notification_data]);
}

function achievement_add_variable(_key, _value, _save = false)
{
    var q = 
    {
        init_value: _value,
        value: _value,
        save: _save
    };
    ds_map_add(variables, _key, q);
    return q;
}

function achievement_get_variable(_key)
{
    return ds_map_find_value(variables, _key);
}

function achievement_unlock(_achievement, _text, _achievement_sprite)
{
    var b = achievement_get_struct(_achievement);
    
    with (b)
    {
        unlocked = true;
        tv_push_prompt(_text, tvprompt_type.normal, _achievement_sprite, 2);
        quick_ini_write_real(get_savefile_ini(), "achievements", name, true);
        gamesave_async_save();
    }
    
    with (obj_achievementviewer)
        event_perform(ev_other, ev_room_start);
}

function achievement_save_variables(_achievement_list)
{    
    for (var i = 0; i < ds_list_size(_achievement_list); i++)
    {
        var b = ds_list_find_value(_achievement_list, i);
        
        with (b)
        {
            var size = ds_map_size(variables);
            var key = ds_map_find_first(variables);
            
            for (i = 0; i < size; i++)
            {
                var q = ds_map_find_value(variables, key);
                
                if (q.save)
                    quick_ini_write_real(get_savefile_ini(), "achievements_variables", key, q.value);
                
                key = ds_map_find_next(variables, key);
            }
        }
    }
}

function achievements_load(_achievement_list)
{    
    for (var i = 0; i < ds_list_size(_achievement_list); i++)
    {
        var b = ds_list_find_value(_achievement_list, i);
        
        with (b)
        {
            unlocked = ini_read_real("achievements", name, false);
            var size = ds_map_size(variables);
            var key = ds_map_find_first(variables);
            
            for (i = 0; i < size; i++)
            {
                var q = ds_map_find_value(variables, key);
                
                if (q.save)
                    q.value = ini_read_real("achievements_variables", key, q.init_value);
                
                key = ds_map_find_next(variables, key);
            }
        }
    }
}

function achievement_get_struct(_achievement_name)
{
    var l = obj_achievementtracker.achievements_update;
    var b = noone;
    
    for (var i = 0; i < ds_list_size(l); i++)
    {
        var q = ds_list_find_value(l, i);
        
        if (q.name == _achievement_name)
        {
            b = q;
            break;
        }
    }
    
    if (b == noone)
    {
        l = obj_achievementtracker.achievements_notify;
        
        for (i = 0; i < ds_list_size(l); i++)
        {
            b = ds_list_find_value(l, i);
            
            if (q.name == _achievement_name)
            {
                b = q;
                break;
            }
        }
    }
    
    return b;
}

