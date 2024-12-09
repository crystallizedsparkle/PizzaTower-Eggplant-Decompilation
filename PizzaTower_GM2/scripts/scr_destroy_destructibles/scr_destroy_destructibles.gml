function scr_destroy_destructibles(_x_offset, _y_offset)
{
    var _num = instance_place_list(x + _x_offset, y + _y_offset, obj_destructibles, global.instancelist, false);
    
    if (_num > 0)
    {
        for (var i = 0; i < ds_list_size(global.instancelist); i++)
            instance_destroy(ds_list_find_value(global.instancelist, i));
        
        ds_list_clear(global.instancelist);
    }
}
