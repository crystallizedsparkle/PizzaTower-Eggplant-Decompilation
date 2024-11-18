function state_turret_normal()
{
    var col, col2, colX, colY;
    
    sprite_index = idlespr;
    can_fire = true;
    col = collision_line(x, y, targetplayer.x, targetplayer.y, obj_solid, false, true);
    col2 = collision_line(x, y, targetplayer.x, targetplayer.y, obj_slope, false, true);
    colX = (image_xscale > 0) ? (targetplayer.x > x) : (targetplayer.x < x);
    colY = targetplayer.bbox_bottom > bbox_top && targetplayer.bbox_top < bbox_bottom;
    
    if (col == -4 && col2 == -4 && colX && colY)
    {
        state = UnknownEnum.Value_128;
        can_fire = true;
        charge_buffer = charge_max;
        stopfiring = 100;
    }
}

function state_turret_charge()
{
    sprite_index = shootspr;
    
    if (charge_buffer > 0)
    {
        charge_buffer--;
    }
    else if (can_fire)
    {
        with (instance_create(x, y, obj_enemybullet))
        {
            image_xscale = other.image_xscale;
            vsp = random_range(-1, 1);
        }
        
        can_fire = false;
        alarm[0] = fire_max;
    }
    
    stopfiring--;
    
    if (stopfiring <= 0)
    {
        state = UnknownEnum.Value_0;
        charge_buffer = charge_max;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_128 = 128
}
