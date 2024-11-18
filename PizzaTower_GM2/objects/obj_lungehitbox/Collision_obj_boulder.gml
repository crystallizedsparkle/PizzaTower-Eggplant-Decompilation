if (other.state != UnknownEnum.Value_4 && playerid.state != UnknownEnum.Value_79)
{
    other.state = UnknownEnum.Value_4;
    
    if (playerid.object_index == obj_player1)
        other.grabbedby = 1;
    else
        other.grabbedby = 2;
    
    with (playerid)
    {
        state = UnknownEnum.Value_79;
        baddiegrabbedID = other.id;
        grabbingenemy = true;
        movespeed = 0;
        image_index = 0;
        sprite_index = spr_haulingstart;
    }
}

enum UnknownEnum
{
    Value_4 = 4,
    Value_79 = 79
}
