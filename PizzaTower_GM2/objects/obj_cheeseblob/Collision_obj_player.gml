if (other.state != UnknownEnum.Value_61)
{
    repeat (8)
    {
        with (create_debris(x, y, 1136))
        {
            vsp = random_range(-5, 0);
            hsp = random_range(-3, 3);
        }
    }
    
    if (other.state != UnknownEnum.Value_24)
        tv_push_prompt_once(tv_create_prompt("This is the cheese transformation text", UnknownEnum.Value_2, 2457, 3), "cheesepep");
    
    other.state = UnknownEnum.Value_24;
    other.movespeed = 0;
    other.sprite_index = other.spr_cheesepepintro;
    instance_destroy();
}

enum UnknownEnum
{
    Value_2 = 2,
    Value_24 = 24,
    Value_61 = 61
}
