var accel, tx, ty, dir, lx, ly;

accel = 2;

with (obj_player)
{
    if (room == rank_room && check_player_coop())
    {
        tx = 480;
        
        if (object_index == obj_player2)
            tx += 100;
        
        ty = 270;
        dir = point_direction(x, y, tx, ty);
        lx = lengthdir_x(accel, dir);
        ly = lengthdir_y(accel, dir);
        x = Approach(x, tx, abs(lx));
        y = Approach(y, ty, abs(ly));
    }
}

obj_camera.visible = false;

if (fadealpha > 1)
{
    fadein = true;
    
    if (room != rank_room)
        room = rank_room;
}

if (fadein == false)
    fadealpha += 0.1;
else if (fadein == true)
    fadealpha -= 0.1;