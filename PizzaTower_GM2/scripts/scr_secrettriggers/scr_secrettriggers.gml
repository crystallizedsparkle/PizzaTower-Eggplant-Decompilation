function secret_add(_func1, _func2)
{
    with (obj_secretmanager)
    {
        ds_list_add(secrettriggers, [_func2]);
        
        if (_func1 != noone)
            method(id, _func1)();
    }
}

function secret_add_touchall(_room, _trigger, _id)
{
    with (obj_secretmanager)
        ds_list_add(touchall, [_room, _trigger, _id]);
}

function secret_add_touchall_requirement(_index, _requirement)
{
    touchrequirement[_index] = [_requirement, false];
}

function secret_check_touchall()
{
    if (touchrequirement != noone && is_array(touchrequirement))
    {
        for (var xx = 0; xx < array_length(touchrequirement); xx++)
        {
            var t = 0;
            
            for (var i = 0; i < ds_list_size(touchall); i++)
            {
                var b = ds_list_find_value(touchall, i);
                
                if (b[1] == xx)
                    t++;
            }
            
            if (t == touchrequirement[xx][0])
                touchrequirement[xx][1] = true;
        }
        
        var b = true;
        
        for (var i = 0; i < array_length(touchrequirement); i++)
        {
            if (!touchrequirement[i][1])
            {
                b = false;
                break;
            }
        }
        
        if (b)
            return true;
    }
    
    return false;
}

function secret_check_trigger(_num)
{
    var _found = false;
    
    with (obj_secrettrigger)
    {
        if (trigger == _num && active)
            _found = true;
    }
    
    if (_found)
    {
        trace(
        {
            found: _found
        });
    }
    
    return _found;
}

function secret_open_portal(_num)
{
    with (obj_secretportal)
    {
        if (trigger == _num && ds_list_find_index(global.saveroom, id) == -1 && !place_meeting(x, y, obj_marbleblock) && !place_meeting(x, y, obj_secretblock) && !place_meeting(x, y, obj_secretbigblock) && !place_meeting(x, y, obj_secretmetalblock) && !place_meeting(x, y, obj_secretdestroyable))
            active = true;
    }
}

function secret_close_portal(_num, _bool = false)
{
    with (obj_secretportal)
    {
        if (trigger == _num && sprite_index != spr_secretportal_close)
        {
            sprite_index = spr_secretportal_close;
            
            if (!_bool)
                image_index = 0;
            else
                image_index = 14;
            
            active = false;
        }
    }
}

function secret_close_portalID(_id)
{
    with (_id)
    {
        sprite_index = spr_secretportal_close;
        image_index = 14;
        active = false;
    }
}
