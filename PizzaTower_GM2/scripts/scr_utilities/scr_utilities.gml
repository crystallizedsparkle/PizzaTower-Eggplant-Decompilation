function Approach(_from, _to, _speed)
{
    if (_from < _to)
    {
        _from += _speed;
        
        if (_from > _to)
            return _to;
    }
    else
    {
        _from -= _speed;
        
        if (_from < _to)
            return _to;
    }
    
    return _from;
}

function camera_zoom(_target, _speed)
{
    with (obj_camera)
    {
        targetzoom = _target;
        targetzoom = clamp(targetzoom, 0, max_zoom);
        
        if (_speed != undefined)
            zoomspd = abs(_speed);
    }
}

function camera_set_zoom(_target)
{
    with (obj_camera)
        zoom = _target;
}

function try_solid(_hsp, _vsp, _obj, _iterations)
{
    var old_x = x;
    var old_y = y;
    var n = -1;
    
    for (var i = 0; i < _iterations; i++)
    {
        x += _hsp;
        y += _vsp;
        
        if (!scr_solid(x, y))
        {
            n = i + 1;
            break;
        }
    }
    
    x = old_x;
    y = old_y;
    return n;
}

function ledge_bump(_iterations)
{
    var old_x = x;
    var old_y = y;
    x += (xscale * 4);
    var ty = try_solid(0, -1, obj_solid, _iterations);
    x = old_x;
    
    if (ty != -1)
    {
        y -= ty;
        x += xscale;
        
        if (scr_solid(x, y))
        {
            x = old_x;
            y = old_y;
            return true;
        }
        
        return false;
    }
    
    return true;
}

function instance_create_unique(_x, _y, _obj)
{
    if (instance_exists(_obj))
        return noone;
    
    var b = instance_create(_x, _y, _obj);
    return b;
}

function get_solid_difference(_hsp, _vsp, _iterations)
{
    var old_x = x;
    var old_y = y;
    var n = 0;
    
    for (var i = 0; i < _iterations; i++)
    {
        x += _hsp;
        y += _vsp;
        
        if (!scr_solid(x, y))
            n++;
    }
    
    x = old_x;
    y = old_y;
    return n;
}

function trace()
{
    var _string = "";
    
    for (var i = 0; i < argument_count; i++)
        _string += string(argument[i]);
    
    show_debug_message(_string);
}

function concat()
{
    var _string = "";
    
    for (var i = 0; i < argument_count; i++)
        _string += string(argument[i]);
    
    return _string;
}

function ds_list_add_unique(_entry)
{  
    if (argument_count > 1)
    {
        for (var i = 1; i < argument_count; i++)
        {
            var b = argument[i];
            
            if (ds_list_find_index(_entry, b) == -1)
                ds_list_add(_entry, b);
        }
    }
}

function point_in_camera(_x, _y, _cam)
{
    var cam_x = camera_get_view_x(_cam);
    var cam_y = camera_get_view_y(_cam);
    var cam_w = camera_get_view_width(_cam);
    var cam_h = camera_get_view_height(_cam);
    return point_in_rectangle(_x, _y, cam_x, cam_y, cam_x + cam_w, cam_y + cam_h);
}

function point_in_camera_ext(_x, _y, _cam, _width, _height)
{
    var cam_x, cam_y, cam_w, cam_h;
    
    var cam_x = camera_get_view_x(_cam);
    var cam_y = camera_get_view_y(_cam);
    var cam_w = camera_get_view_width(_cam);
    var cam_h = camera_get_view_height(_cam);
    return point_in_rectangle(_x, _y, cam_x - _width, cam_y - _height, cam_x + cam_w + _width, cam_y + cam_h + _height);
}

function bbox_in_camera(_cam, _threshold)
{
    if (is_undefined(_threshold))
        _threshold = 0;
    
    var cam_x = camera_get_view_x(_cam);
    var cam_y = camera_get_view_y(_cam);
    var cam_w = camera_get_view_width(_cam);
    var cam_h = camera_get_view_height(_cam);
    return bbox_left < (cam_x + cam_w + _threshold) && bbox_right > (cam_x - _threshold) && bbox_top < (cam_y + cam_h + _threshold) && bbox_bottom > (cam_y - _threshold);
}

function instance_nearest_random(_obj, _random_range)
{
    var l = instance_furthest(x, y, _obj);
    var list = ds_list_create();
    
    for (var i = 0; i < instance_number(_obj); i++)
    {
        var b = instance_find(_obj, i);
        var t = distance_to_object(b);
        
        if (t <= l)
            ds_list_add(list, b);
    }
    
    var b = undefined;
    
    if (ds_list_size(list) > 0)
    {
        var n = irandom(_random_range);
        
        if (ds_list_size(list) < n)
            n = ds_list_size(list) - 1;
        
        b = ds_list_find_value(list, ds_list_size(list) - n);
    }
    
    ds_list_destroy(list);
    return b;
}

function instance_random(_obj)
{
    return instance_find(_obj, irandom(instance_number(_obj) - 1));
}

function heat_calculate(_heat)
{
    trace(global.stylemultiplier);
    return _heat + round(_heat * global.stylemultiplier);
}
