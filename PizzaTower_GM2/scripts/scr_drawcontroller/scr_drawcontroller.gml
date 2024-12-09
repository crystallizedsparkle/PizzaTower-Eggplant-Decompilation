function get_dark(_color, _bool)
{
    var d, b, bb, dis, t;
    
    if (_bool)
    {
        d = room_width * room_height;
        b = d;
        bb = b;
        
        with (obj_lightsource)
        {
            dis = distance_to_object(other);
            
            if (distance_to_object(other) < d)
            {
                bb = dis / distance;
                
                if (bb < b)
                {
                    b = bb;
                    d = dis;
                }
            }
        }
        
        t = (b + 0.4) * 255;
        t = clamp(t, 0, 255);
        return make_color_rgb(color_get_red(_color) - t, color_get_green(_color) - t, color_get_blue(_color) - t);
    }
    else
    {
        return image_blend;
    }
}
