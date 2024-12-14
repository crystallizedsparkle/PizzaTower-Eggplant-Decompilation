function scr_string_width(_str)
{
    var pos = 0;
    var w = 0;
    var originalstr = _str;
    var str_arr = array_create(0);
    
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
        w = string_width(_str);
    
    for (var i = 0; i < array_length(str_arr); i++)
    {
        var b = str_arr[i];
        
        if (string_width(b) > w)
            w = string_width(b);
    }
    
    return w;
}

function scr_separate_text(_str)
{
    var _pos, _oldpos;
    
    draw_set_font(font2);
    
    while (scr_string_width(_str) > (obj_camera.original_cam_width - (rpadding * 2) - string_width("a")))
    {
        _pos = string_length(_str);
        _oldpos = _pos;
        
        while (string_char_at(_str, _pos) != " ")
        {
            _pos--;
            
            if (_pos < 0)
                _pos = _oldpos;
        }
        
        if (string_char_at(_str, _pos) == " ")
            _str = string_delete(_str, _pos, 1);
        
        _str = string_insert("\n", _str, _pos);
    }
    
    return _str;
}

function scr_calculate_text(_str)
{
    var pos, str2;
    
    draw_set_font(font2);
    pos = 0;
    str2 = "";
    
    while (pos <= string_length(_str))
    {
        pos++;
        str2 = string_insert(string_char_at(_str, pos), str2, string_length(str2) + 1);
        str2 = scr_separate_text(str2);
    }
    
    return str2;
}

function scr_calculate_height(_str)
{
    var str2;
    
    str2 = scr_calculate_text(_str);
    return string_height(str2);
}
