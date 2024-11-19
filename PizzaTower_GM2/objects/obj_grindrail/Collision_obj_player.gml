if (place_meeting(x, y, other) && other.state != states.tumble && other.state != states.backbreaker && other.state != states.bump && other.y > other.yprevious && other.y < y)
{
    if (!other.isgustavo)
    {
        other.y = y - 49;
        other.state = states.grind;
    }
    else if (other.state != states.ratmountgrind)
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
        other.state = states.ratmountgrind;
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
