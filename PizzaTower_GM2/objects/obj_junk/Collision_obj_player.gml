if (!grabbed && (other.state == UnknownEnum.Value_42 || other.state == UnknownEnum.Value_80 || other.state == UnknownEnum.Value_43) && unpickable == false)
{
    instance_create(x + (obj_player1.xscale * 40), y, obj_punchdust);
    
    with (other)
    {
        image_index = 0;
        sprite_index = spr_haulingstart;
        baddiegrabbedID = other.id;
        grabbingenemy = true;
        state = UnknownEnum.Value_79;
    }
    
    playerid = other.object_index;
    grabbed = true;
}

if (!grabbed && unpickable == false && !ratgrabbed && other.state == UnknownEnum.Value_193)
{
    ratplayerid = other.id;
    ratgrabbed = true;
    state = UnknownEnum.Value_205;
    other.ratgrabbedID = id;
    other.state = UnknownEnum.Value_191;
}

enum UnknownEnum
{
    Value_42 = 42,
    Value_43,
    Value_79 = 79,
    Value_80,
    Value_191 = 191,
    Value_193 = 193,
    Value_205 = 205
}
