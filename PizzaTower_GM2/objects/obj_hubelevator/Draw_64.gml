var w, h, pad, yy, i, txt, c;

if (state == states.titlescreen)
{
    w = 0;
    h = 0;
    pad = 16;
    yy = 0;
    
    for (i = 0; i < array_length(hub_array); i++)
    {
        txt = hub_array[i][1];
        
        if (string_width(txt) > w)
            w = string_width(txt);
        
        h += string_height(txt);
    }
    
    w += pad;
    h += pad;
    yy = 270 + (h / 2);
    draw_rectangle_color(480 - (w / 2), 270 - (h / 2), 480 + (w / 2), yy, c_black, c_black, c_black, c_black, false);
    yy -= (pad / 2);
    draw_set_valign(fa_bottom);
    draw_set_halign(fa_center);
    
    for (i = 0; i < array_length(hub_array); i++)
    {
        c = (selected == i) ? 16777215 : 8421504;
        txt = hub_array[i][1];
        draw_text_color(480, yy, txt, c, c, c, c, 1);
        yy -= string_height(txt);
    }
}

enum UnknownEnum
{
    Value_18 = 18
}
