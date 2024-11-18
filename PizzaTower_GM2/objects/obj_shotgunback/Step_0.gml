with (obj_player1)
{
    if (shotgunAnim == true)
    {
        if (state != UnknownEnum.Value_0 && state != UnknownEnum.Value_100 && state != UnknownEnum.Value_71 && state != UnknownEnum.Value_111 && state != UnknownEnum.Value_92 && state != UnknownEnum.Value_42)
            other.visible = true;
        else
            other.visible = false;
    }
    
    other.x = x - (20 * xscale);
    other.y = y;
    other.image_xscale = -xscale;
}

if (room == rank_room)
    visible = false;

enum UnknownEnum
{
    Value_0,
    Value_42 = 42,
    Value_71 = 71,
    Value_92 = 92,
    Value_100 = 100,
    Value_111 = 111
}
