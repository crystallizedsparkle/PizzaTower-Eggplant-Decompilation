with (obj_player1)
{
    if (shotgunAnim == true)
    {
        if (state != states.normal && state != states.crouch && state != states.shotgunfreefall && state != states.freefallland && state != states.jump && state != states.handstandjump)
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
