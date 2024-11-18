var _offset_x, _offset_y;

if (playerid > -1)
    exit;

if (state != UnknownEnum.Value_0)
    exit;

if (other.state == UnknownEnum.Value_107)
    exit;

if (other.state == UnknownEnum.Value_186)
    exit;

if (object_index != obj_tubeenter && other.state != UnknownEnum.Value_150)
    exit;

_offset_x = 32 * image_xscale;
_offset_y = 14 * image_yscale;

with (other)
{
    if (other.object_index == obj_tubeenter && other.stored_spd == 0)
    {
        if (abs(hsp) < other.movespeed)
            hsp = other.movespeed;
        
        if (abs(vsp) < other.movespeed)
            vsp = other.movespeed;
        
        other.stored_spd = max(abs(hsp), abs(vsp));
        trace(other.stored_spd);
    }
    
    state = UnknownEnum.Value_150;
    hsp = 0;
    movespeed = 0;
    vsp = 0;
    tube_vsp = 0;
    x = Approach(x, other.xstart + _offset_x, other.approach_spd);
    y = Approach(y, other.ystart + _offset_y, other.approach_spd);
    
    if (y > (other.y + _offset_y))
        tube_vsp = -other.approach_spd;
}

if (floor(other.x) == (xstart + _offset_x) && floor(other.y) == (ystart + _offset_y))
{
    other.x = xstart + _offset_x;
    other.y = ystart + _offset_y;
    image_index = 0;
    playerid = other.id;
    image_speed = 0.5;
    other.state = UnknownEnum.Value_150;
    other.tube_vsp = 0;
    state = UnknownEnum.Value_150;
}

enum UnknownEnum
{
    Value_0,
    Value_107 = 107,
    Value_150 = 150,
    Value_186 = 186
}
