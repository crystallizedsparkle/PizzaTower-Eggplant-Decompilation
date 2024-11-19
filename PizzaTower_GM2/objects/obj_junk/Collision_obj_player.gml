if (!grabbed && (other.state == states.handstandjump || other.state == states.punch || other.state == states.lungeattack) && unpickable == false)
{
    instance_create(x + (obj_player1.xscale * 40), y, obj_punchdust);
    
    with (other)
    {
        image_index = 0;
        sprite_index = spr_haulingstart;
        baddiegrabbedID = other.id;
        grabbingenemy = true;
        state = states.grab;
    }
    
    playerid = other.object_index;
    grabbed = true;
}

if (!grabbed && !unpickable && !ratgrabbed && other.state == states.ratmountattack)
{
    ratplayerid = other.id;
    ratgrabbed = true;
    state = states.ratgrabbed;
    other.ratgrabbedID = id;
    other.state = states.ratmount;
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
