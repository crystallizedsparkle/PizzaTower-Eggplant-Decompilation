if (place_meeting(x, y, other) && other.state != UnknownEnum.Value_5 && other.state != UnknownEnum.Value_84 && other.state != UnknownEnum.Value_106 && other.y > other.yprevious && other.y < y)
{
    if (!other.isgustavo)
    {
        other.y = y - 49;
        other.state = UnknownEnum.Value_78;
    }
    else if (other.state != UnknownEnum.Value_202)
    {
        with (other)
        {
            if (brick == true)
            {
                with (instance_create(x, y, obj_brickcomeback))
                    wait = true;
            }
            
            brick = false;
        }
        
        other.y = y + 8;
        other.state = UnknownEnum.Value_202;
    }
}

enum UnknownEnum
{
    Value_5 = 5,
    Value_78 = 78,
    Value_84 = 84,
    Value_106 = 106,
    Value_202 = 202
}
