var val, _x, _y, _xstart, yy, xx;

if (other.state != UnknownEnum.Value_186)
{
    if (obj_player1.character == "V")
        global.playerhealth = clamp(global.playerhealth + 100, 0, 100);
    
    global.heattime = 60;
    
    with (obj_camera)
        healthshaketime = 120;
    
    scr_soundeffect(18);
    val = heat_calculate(1000);
    
    if (other.object_index == obj_player1)
        global.collect += val;
    else
        global.collectN += val;
    
    if (global.bullet < 3)
        global.bullet += 1;
    
    _x = x - 48;
    _y = y - 48;
    _xstart = _x;
    
    for (yy = 0; yy < 4; yy++)
    {
        for (xx = 0; xx < 4; xx++)
        {
            create_collect(_x, _y, obj_player1.ispeppino ? choose(1563, 1559, 2709, 1561) : choose(2080, 2082, 2086, 2087, 2088));
            _x += 16;
        }
        
        _x = _xstart;
        _y += 16;
    }
    
    with (instance_create(x + 16, y, obj_smallnumber))
        number = string(val);
    
    instance_destroy();
    
    if (secret && !instance_exists(obj_fadeout))
    {
        with (obj_player)
        {
            targetRoom = lastroom;
            targetDoor = "S";
        }
        
        instance_create(x, y, obj_fadeout);
    }
}

enum UnknownEnum
{
    Value_186 = 186
}