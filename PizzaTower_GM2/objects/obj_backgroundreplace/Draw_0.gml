var cx, cy, cw, ch, sprw, sprh, yy, xx, lx, ly, i, b, ix;

if (backgroundID != -4)
{
    cx = camera_get_view_x(view_camera[0]);
    cy = camera_get_view_y(view_camera[0]);
    cw = camera_get_view_width(view_camera[0]);
    ch = camera_get_view_height(view_camera[0]);
    sprw = sprite_get_width(background_spr);
    sprh = sprite_get_height(background_spr);
    yy = floor(cy / sprh) - 1;
    
    while (yy < (round((cy + ch) / sprh) + 1))
    {
        xx = floor(cx / sprw) - 1;
        
        while (xx < (round((cx + cw) / sprw) + 1))
        {
            lx = layer_get_x(backgroundID) + (xx * sprw);
            ly = layer_get_y(backgroundID) + (yy * sprh);
            draw_sprite(background_spr, 0, lx, ly);
            
            if (chunks != -4)
            {
                for (i = 0; i < array_length(chunks); i++)
                {
                    b = chunks[i];
                    draw_sprite(b[0], b[3], lx + b[1], ly + b[2]);
                }
            }
            
            xx++;
        }
        
        yy++;
    }
    
    for (i = 0; i < array_length(chunks); i++)
    {
        b = chunks[i];
        ix = b[3];
        ix += b[4];
        
        if (ix > (sprite_get_number(b[0]) - 1))
            ix = frac(ix);
        
        array_set(array_get(chunks, i), 3, ix);
    }
}
