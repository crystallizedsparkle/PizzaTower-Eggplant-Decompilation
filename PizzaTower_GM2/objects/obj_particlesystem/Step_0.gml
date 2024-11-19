var i, q, _destroy, outofx, outofy, b, _dir;

if (!ds_list_empty(global.debris_list))
{
    for (i = 0; i < ds_list_size(global.debris_list); i++)
    {
        q = ds_list_find_value(global.debris_list, i);
        
        if (is_struct(q))
        {
            with (q)
            {
                if (vsp < 20)
                    vsp += grav;
                
                if (type == debris.fade_effect)
                {
                    vsp = 0;
                    alpha -= 0.05;
                }
                
                x += hsp;
                y += vsp;
                _destroy = false;
                
                if (animated)
                {
                    image_index += image_speed;
                    
                    if (image_index > (image_number - 1))
                    {
                        image_index = frac(image_index);
                        
                        if (destroyonanimation)
                            _destroy = true;
                    }
                }
                
                outofx = x > (room_width + sprw) || x < -sprw;
                outofy = y > (room_height + sprh) || y < -sprh;
                
                if (outofx || outofy || (type == debris.fade_effect && alpha <= 0))
                    _destroy = true;
                
                if (_destroy)
                {
                    ds_list_delete(global.debris_list, i);
                    i--;
                    q = undefined;
                }
                else
                {
                }
            }
        }
    }
}

if (!ds_list_empty(global.collect_list))
{
    for (i = 0; i < ds_list_size(global.collect_list); i++)
    {
        b = ds_list_find_value(global.collect_list, i);
        
        if (is_struct(b))
        {
            with (b)
            {
                _dir = point_direction(x, y, 110, 80);
                hsp = lengthdir_x(16, _dir);
                vsp = lengthdir_y(16, _dir);
                x += hsp;
                y += vsp;
                image_index += 0.35;
                
                if (image_index > (image_number - 1))
                    image_index = frac(image_index);
                
                outofx = x < 140;
                outofy = y < 120;
                
                if (outofx && outofy)
                {
                    with (obj_camera)
                        collect_shake += 10;
                    
                    ds_list_delete(global.collect_list, i);
                    i--;
                    b = undefined;
                }
                else
                {
                }
            }
        }
    }
}

enum UnknownEnum
{
    Value_1 = 1
}
