playerid = obj_player2.id;

if (room != Realtitlescreen && room != rm_levelselect && room != characterselect)
{
    with (playerid)
    {
        if (state != UnknownEnum.Value_186 && !bbox_in_camera(view_camera[0], 48))
            state = UnknownEnum.Value_186;
    }
}

enum UnknownEnum
{
    Value_186 = 186
}
