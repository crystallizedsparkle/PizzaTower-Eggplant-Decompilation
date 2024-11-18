x = playerid.x;
y = playerid.y;

with (playerid)
{
    if (state != UnknownEnum.Value_79 || sprite_index != spr_swingding)
        instance_destroy(other);
}

enum UnknownEnum
{
    Value_79 = 79
}
