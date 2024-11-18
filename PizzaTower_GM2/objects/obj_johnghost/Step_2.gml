var cx;

cx = camera_get_view_x(view_camera[0]);

switch (state)
{
    case UnknownEnum.Value_134:
        if (playerid.x != x)
            image_xscale = sign(playerid.x - x);
        
        currentx = Approach(currentx, targetx, 2);
        x = cx + currentx;
        
        if (currentx == targetx)
        {
            state = UnknownEnum.Value_128;
            attack_buffer = attack_max;
        }
        
        y = Approach(y, playerid.y, 8);
        break;
    
    case UnknownEnum.Value_128:
        if (playerid.x != x)
            image_xscale = sign(playerid.x - x);
        
        y = Approach(y, playerid.y, 8);
        x = cx + currentx;
        
        if (attack_buffer > 0)
        {
            attack_buffer--;
        }
        else
        {
            state = UnknownEnum.Value_80;
            create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
        }
        
        break;
    
    case UnknownEnum.Value_80:
        if (!hitboxcreate)
        {
            with (instance_create(x, y, obj_forkhitbox))
            {
                ID = other.id;
                other.hitboxcreate = true;
            }
        }
        
        x += (image_xscale * 14);
        break;
}

enum UnknownEnum
{
    Value_80 = 80,
    Value_128 = 128,
    Value_134 = 134
}
