var mh_id;

mh_id = other.id;

with (playerid)
{
    if (state != states.morthook)
    {
        state = states.morthook;
        morthookID = mh_id;
        tauntstoredmovespeed = movespeed;
        movespeed = 12;
        jumpstop = false;
        instance_destroy(other);
    }
}

enum UnknownEnum
{
    Value_14 = 14
}
