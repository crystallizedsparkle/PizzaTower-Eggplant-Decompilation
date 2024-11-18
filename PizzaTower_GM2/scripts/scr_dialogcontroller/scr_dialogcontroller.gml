function scr_string_width(argument0)
{
    var pos, w, originalstr, str_arr, i, b;
    
    pos = 0;
    w = 0;
    originalstr = argument0;
    str_arr = array_create(0);
    
    while (pos < string_length(originalstr))
    {
        if (string_copy(originalstr, pos, 2) == "\n")
        {
            array_push(str_arr, string_copy(originalstr, 1, pos));
            string_delete(originalstr, 1, pos);
            pos = 0;
            
            if (originalstr == "")
                break;
        }
        else
        {
            pos++;
        }
    }
    
    if (array_length(str_arr) == 0)
        w = string_width(argument0);
    
    for (i = 0; i < array_length(str_arr); i++)
    {
        b = str_arr[i];
        
        if (string_width(b) > w)
            w = string_width(b);
    }
    
    return w;
}

function scr_separate_text(argument0)
{
    var _pos, _oldpos;
    
    draw_set_font(font2);
    
    while (scr_string_width(argument0) > (obj_camera.original_cam_width - (rpadding * 2) - string_width("a")))
    {
        _pos = string_length(argument0);
        _oldpos = _pos;
        
        while (string_char_at(argument0, _pos) != " ")
        {
            _pos--;
            
            if (_pos < 0)
                _pos = _oldpos;
        }
        
        if (string_char_at(argument0, _pos) == " ")
            argument0 = string_delete(argument0, _pos, 1);
        
        argument0 = string_insert("\n", argument0, _pos);
    }
    
    return argument0;
}

function scr_calculate_text(argument0)
{
    var pos, str2;
    
    draw_set_font(font2);
    pos = 0;
    str2 = "";
    
    while (pos <= string_length(argument0))
    {
        pos++;
        str2 = string_insert(string_char_at(argument0, pos), str2, string_length(str2) + 1);
        str2 = scr_separate_text(str2);
    }
    
    return str2;
}

function scr_calculate_height(argument0)
{
    var str2;
    
    str2 = scr_calculate_text(argument0);
    return string_height(str2);
}
