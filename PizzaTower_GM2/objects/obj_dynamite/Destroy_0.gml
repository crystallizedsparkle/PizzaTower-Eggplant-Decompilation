if (playerid.object_index == obj_vigilanteboss && place_meeting(x, y, obj_player))
{
    playerid.state = UnknownEnum.Value_134;
    playerid.walkstate = UnknownEnum.Value_134;
    playerid.movespeed = 0;
}

enum UnknownEnum
{
    Value_134 = 134
}
