var tx, ty, acc;

tx = playerid.x;
ty = playerid.y - 60;
acc = 0.1;

switch (state)
{
    case UnknownEnum.Value_0:
        x = lerp(x, tx, acc);
        y = lerp(y, ty, acc);
        
        if (alarm[0] == -1 && x > (tx - 8) && x < (tx + 8) && y > (ty - 8) && y < (ty + 8))
        {
            alarm[0] = 50;
            x = tx;
            y = ty;
            state = UnknownEnum.Value_8;
        }
        
        break;
    
    case UnknownEnum.Value_8:
        x = lerp(x, tx, 0.2);
        y = lerp(y, ty, 0.2);
        break;
    
    case UnknownEnum.Value_92:
        x += 4;
        y -= 8;
        
        if (!bbox_in_camera(view_camera[0], 10))
            instance_destroy();
        
        break;
}

enum UnknownEnum
{
    Value_0,
    Value_8 = 8,
    Value_92 = 92
}
