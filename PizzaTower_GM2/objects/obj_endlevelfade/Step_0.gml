var accel = 2;

with (obj_player)
{
    if (room == rank_room && check_player_coop())
    {
        var tx = 480;
        
        if (object_index == obj_player2)
            tx += 100;
        
        var ty = 270;
        var dir = point_direction(x, y, tx, ty);
        var lx = lengthdir_x(accel, dir);
        var ly = lengthdir_y(accel, dir);
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

if (!fadein)
    fadealpha += 0.1;
else if (fadein)
    fadealpha -= 0.1;
