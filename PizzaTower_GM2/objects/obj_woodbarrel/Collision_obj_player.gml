if ((other.state == UnknownEnum.Value_42 || other.state == UnknownEnum.Value_80) && other.grounded == true)
{
    instance_create(x + (obj_player1.xscale * 40), y, obj_punchdust);
    
    with (other)
    {
        image_index = 0;
        sprite_index = spr_haulingstart;
        grabbingenemy = true;
        baddiegrabbedID = other.id;
        state = UnknownEnum.Value_79;
    }
    
    playerid = other.object_index;
    grabbed = true;
}

if (other.state == UnknownEnum.Value_104 || other.state == UnknownEnum.Value_121 || (other.state == UnknownEnum.Value_65 && grounded))
{
    create_particle(x, y, UnknownEnum.Value_9, 0);
    
    with (other)
    {
        vsp = 0;
        mask_index = spr_crouchmask;
        x = other.x;
        y = other.y;
        state = UnknownEnum.Value_113;
        sprite_index = spr_barrelroll;
        movespeed = 12;
    }
    
    instance_destroy();
}

enum UnknownEnum
{
    Value_9 = 9,
    Value_42 = 42,
    Value_65 = 65,
    Value_79 = 79,
    Value_80,
    Value_104 = 104,
    Value_113 = 113,
    Value_121 = 121
}
