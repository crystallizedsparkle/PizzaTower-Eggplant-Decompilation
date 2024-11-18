var _maxhsp, _dir;

if (state != UnknownEnum.Value_147 && state != UnknownEnum.Value_84)
    exit;

with (other)
{
    _maxhsp = abs(spd);
    _dir = sign(spd);
    
    if (x != other.x)
        _dir = sign(x - other.x);
    
    spd = _maxhsp * _dir;
}

if (state != UnknownEnum.Value_147)
{
    sprite_index = parryspr;
    movespeed = 8;
    state = UnknownEnum.Value_147;
    image_index = 0;
}

enum UnknownEnum
{
    Value_84 = 84,
    Value_147 = 147
}
