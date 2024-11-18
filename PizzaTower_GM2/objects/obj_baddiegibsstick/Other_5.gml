var col, colSlope, colPlatform;

if (!collisioned)
{
    col = collision_line(x, y, x, y + room_height, obj_solid, false, true);
    colSlope = collision_line(x, y, x, y + room_height, obj_slope, false, true);
    colPlatform = collision_line(x, y, x, y + room_height, obj_platform, false, true);
    
    if (col != -4 || colSlope != -4 || colPlatform != -4)
    {
        while (!grounded)
        {
            hsp = 0;
            vsp = 1;
            scr_collide();
        }
    }
    
    collisioned = true;
    hsp = 0;
    vsp = 0;
    ds_list_add(global.baddietomb, [room, x, y]);
}
