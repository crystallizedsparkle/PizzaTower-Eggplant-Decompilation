var b, i;

if (!ds_exists(tex_list, ds_type_list))
    exit;

if (!ds_list_empty(tex_list))
{
    b = ds_list_find_value(tex_list, 0);
    
    for (i = 0; i < array_length(b); i++)
    {
        if (!texture_is_ready(b[i]))
            texture_prefetch(b[i]);
    }
    
    ds_list_delete(tex_list, 0);
}
else
{
    ds_list_destroy(tex_list);
    room_goto(Realtitlescreen);
}

alarm[0] = 1;