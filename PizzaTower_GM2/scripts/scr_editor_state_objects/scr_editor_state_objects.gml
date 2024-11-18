function scr_editor_state_objects()
{
    var mx, my, i, b;
    
    mx = mouse_x;
    my = mouse_y;
    
    if (button == -4 && key_mbleft2)
    {
        scr_editor_get_object_mouse(mx, my);
        
        if (object != -4 && ds_list_empty(selectedobjects))
            scr_do_command(new PlaceCommand(mx, my, object));
        
        if (!ds_list_empty(selectedobjects))
        {
            for (i = 0; i < ds_list_size(selectedobjects); i++)
            {
                b = ds_list_find_value(selectedobjects, i);
                
                with (b)
                    selected = true;
            }
        }
    }
}

function scr_editor_get_object_mouse(argument0, argument1)
{
    var num, o, i, b;
    
    scr_editor_clear_selectedobjects();
    num = instance_place_list(argument0, argument1, 232, global.instancelist, true);
    o = -4;
    
    for (i = 0; i < num; i++)
    {
        b = ds_list_find_value(global.instancelist, i);
        
        with (b)
        {
            if (layerdepth == other.layerdepth && (o == -4 || depth < o.depth))
                o = b;
        }
    }
    
    ds_list_clear(global.instancelist);
    
    if (o != -4)
        ds_list_add(selectedobjects, o);
}

function scr_editor_clear_selectedobjects()
{
    var i, b;
    
    for (i = 0; i < ds_list_size(selectedobjects); i++)
    {
        b = ds_list_find_value(selectedobjects, i);
        
        with (b)
            selected = false;
    }
    
    ds_list_clear(selectedobjects);
}
