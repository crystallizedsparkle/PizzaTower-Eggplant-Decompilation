function sprite_set_size(_xscale, _yscale)
{
    image_xscale = _xscale / sprite_get_width(sprite_index);
    image_yscale = _yscale / sprite_get_width(sprite_index);
}

function snap_tile(_val1, _val2)
{
    return floor(_val1 / _val2) * _val2;
}

function add_object(_index, _name, _sprite, _object, _xoffset = 0, _yoffset = 0)
{
    var s = 1;
    
    if (sprite_get_width(_sprite) >= 64 || sprite_get_height(_sprite) >= 64)
        s = min(64 / sprite_get_width(_sprite), 64 / sprite_get_height(_sprite));
    
    ds_list_add(object_list[_index], 
    {
        name: _name,
        sprite_index: _sprite,
        image_xscale: s,
        image_yscale: s,
        object_index: _object,
        image_xoffset: _xoffset,
        image_yoffset: _yoffset,
        place_xoffset: 0,
        place_yoffset: 0,
        layerdepth: 0
    });
}

function set_object_place_offset(_editor_id, _offset, arg2)
{
    var b = ds_list_find_value(array_get(object_list, _editor_id), ds_list_size(objectlist) - 1);
    b.place_xoffset = _offset;
    b.place_yoffset = _offset;
}

function set_object_layerdepth(_editor_id, _layerdepth)
{
    var b = ds_list_find_value(array_get(object_list, _editor_id), ds_list_size(objectlist) - 1);
    b.layerdepth = _layerdepth;
}

function objectlist_calculate_scrollsize()
{
    var xx = 0;
    var yy = 0;
    
    for (var i = 0; i < ds_list_size(object_list); i++)
    {
        xx += 64;
        
        if (xx >= sprite_width)
        {
            xx = 0;
            yy += 64;
        }
    }
    
    scroll_ymax = yy - sprite_height;
    
    if (scroll_ymax < 0)
        scroll_ymax = 0;
}

function create_buttons_array(_x, _y, _xsize, _ysize, _array)
{
    var xsize = 0;
    draw_set_font(global.editorfont);
    
    for (var i = 0; i < array_length(_array); i++)
    {
        var b = _array[i];
        var t = string_width(b[0]);
        
        if (t > xsize)
            xsize = t + _xsize;
    }
    
    for (i = 0; i < array_length(_array); i++)
    {
        b = _array[i];
        
        with (instance_create_depth(_x, _y + (i * _ysize), depth, obj_textbutton))
        {
            buttonid = i;
            sprite_index = spr_bigbutton;
            sprite_set_size(xsize, _ysize);
            label = b[0];
            
            if (b[1] != noone)
                OnSelect = method(id, b[1]);
            
            if (b[2] != noone)
                OnDeselect = method(id, b[2]);
            
            parent = other.id;
        }
    }
}
