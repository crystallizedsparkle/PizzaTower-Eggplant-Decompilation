if (state == UnknownEnum.Value_17)
{
    with (playerid)
    {
        sprite_index = spr_ghostidle;
        x = other.x;
        y = other.y;
        
        if (key_up2 && other.object_index != obj_randomobject)
        {
            state = UnknownEnum.Value_16;
            vsp = -10;
            create_particle(x, y, UnknownEnum.Value_9, 0);
            visible = true;
            other.state = UnknownEnum.Value_0;
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_9 = 9,
    Value_16 = 16,
    Value_17
}
