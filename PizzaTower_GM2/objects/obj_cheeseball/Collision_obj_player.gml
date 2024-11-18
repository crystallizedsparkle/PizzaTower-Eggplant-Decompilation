if (other.state != UnknownEnum.Value_186 && other.state != UnknownEnum.Value_61)
{
    if (other.state == UnknownEnum.Value_47 || other.state == UnknownEnum.Value_38 || other.state == UnknownEnum.Value_21)
    {
        repeat (8)
        {
            with (create_debris(x, y, 1136))
            {
                vsp = random_range(-5, 0);
                hsp = random_range(-3, 3);
            }
        }
        
        instance_destroy();
    }
    else
    {
        tv_push_prompt_once(tv_create_prompt("This is the cheeseball transformation text", UnknownEnum.Value_2, 2240, 3), "cheeseball");
        other.xscale = image_xscale;
        other.hsp = hsp;
        other.vsp = vsp;
        other.movespeed = 8;
        other.x = x;
        other.y = y;
        other.state = UnknownEnum.Value_21;
        other.stop_buffer = other.stop_max;
        
        repeat (8)
        {
            with (create_debris(x, y, 1136))
            {
                vsp = random_range(-5, 0);
                hsp = random_range(-3, 3);
            }
        }
        
        instance_destroy();
    }
}

enum UnknownEnum
{
    Value_2 = 2,
    Value_21 = 21,
    Value_38 = 38,
    Value_47 = 47,
    Value_61 = 61,
    Value_186 = 186
}
