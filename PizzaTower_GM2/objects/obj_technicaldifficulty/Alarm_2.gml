instance_destroy();

with (playerid)
{
    if (!isgustavo)
        state = UnknownEnum.Value_0;
    else
        state = UnknownEnum.Value_191;
    
    visible = true;
}

with (obj_ghostfollow)
{
    x = xstart;
    y = ystart;
}

enum UnknownEnum
{
    Value_0,
    Value_191 = 191
}
