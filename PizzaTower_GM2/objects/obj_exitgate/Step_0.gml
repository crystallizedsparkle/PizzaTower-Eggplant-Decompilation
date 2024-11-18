var _ty;

if (global.panic == true)
    image_index = 1;

if (drop && global.panic)
{
    switch (dropstate)
    {
        case UnknownEnum.Value_0:
            if (distance_to_object(obj_player1) < 300)
            {
                dropstate = UnknownEnum.Value_15;
                handsprite = 206;
                hand_y = camera_get_view_y(view_camera[0]) - 100;
            }
            
            break;
        
        case UnknownEnum.Value_15:
            if (hand_y < (y - 128))
            {
                hand_y += 6;
            }
            else
            {
                handsprite = 205;
                handindex = 0;
                dropstate = UnknownEnum.Value_4;
            }
            
            break;
        
        case UnknownEnum.Value_4:
            depth = 80;
            _ty = drop_y - 100;
            y = Approach(y, _ty, 3);
            hand_y = y - 128;
            
            if (y == _ty && distance_to_object(obj_player1) < 200)
            {
                dropstate = UnknownEnum.Value_135;
                handindex = 0;
                handsprite = 204;
                vsp = 0;
            }
            
            break;
        
        case UnknownEnum.Value_135:
            if (vsp < 20)
                vsp += grav;
            
            y += vsp;
            
            if (y >= drop_y)
            {
                depth = 50;
                scr_soundeffect(27);
                y = drop_y;
                dropstate = UnknownEnum.Value_126;
                handsprite = 207;
                
                with (obj_camera)
                {
                    shake_mag = 5;
                    shake_mag_acc = 3 / room_speed;
                }
            }
            
            break;
        
        case UnknownEnum.Value_126:
            hand_y -= 6;
            break;
    }
    
    if (handsprite == 204 && floor(handindex) == (sprite_get_number(handsprite) - 1))
        handindex = sprite_get_number(handsprite) - 1;
    
    handindex += 0.35;
}

enum UnknownEnum
{
    Value_0,
    Value_4 = 4,
    Value_15 = 15,
    Value_126 = 126,
    Value_135 = 135
}
