var _x, _y, _xstart, yy, xx;

if (obj_player1.character == "V")
    global.playerhealth = clamp(global.playerhealth + 100, 0, 100);

global.heattime = 60;

with (obj_camera)
    healthshaketime = 120;

scr_soundeffect(18);
global.collect += 1000;
_x = x - 48;
_y = y - 48;
_xstart = _x;

for (yy = 0; yy < 4; yy++)
{
    for (xx = 0; xx < 4; xx++)
    {
        create_collect(_x, _y, choose(1563, 1559, 2709, 1561));
        _x += 16;
    }
    
    _x = _xstart;
    _y += 16;
}

with (instance_create(x + 16, y, obj_smallnumber))
    number = string(1000);

instance_destroy();
