var _number;

if (other.state != UnknownEnum.Value_186)
{
    if (obj_player1.character == "V")
        global.playerhealth = clamp(global.playerhealth + 10, 0, 100);
    
    global.heattime = 60;
    
    with (obj_camera)
        healthshaketime = 60;
    
    scr_soundeffect(44);
    instance_destroy();
    _number = 0;
    
    if (global.fill <= 2500)
    {
        global.fill += 500;
        _number = 500;
    }
    else
    {
        _number = heat_calculate(50);
        global.collect += _number;
    }
    
    create_collect(x, y, sprite_index);
    
    with (instance_create(x + 16, y, obj_smallnumber))
        number = string(_number);
}

enum UnknownEnum
{
    Value_186 = 186
}