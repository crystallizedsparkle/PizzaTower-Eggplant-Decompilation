with (obj_player)
{
    if (character != "V")
    {
        if ((state == UnknownEnum.Value_38 || state == UnknownEnum.Value_184) && (place_meeting(x + hsp, y, other) || place_meeting(x + xscale, y, other)))
            instance_destroy(other);
        
        with (other)
        {
            if (place_meeting(x, y + 1, other) || place_meeting(x, y - 1, other) || place_meeting(x - 1, y, other) || place_meeting(x + 1, y, other))
            {
                if (place_meeting(x, y - 1, other) && (other.state == UnknownEnum.Value_47 || other.state == UnknownEnum.Value_19))
                {
                    instance_destroy();
                    tile_layer_delete_at(1, x, y);
                }
            }
        }
    }
}

enum UnknownEnum
{
    Value_19 = 19,
    Value_38 = 38,
    Value_47 = 47,
    Value_184 = 184
}
