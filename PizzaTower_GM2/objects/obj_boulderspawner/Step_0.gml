if (cooldown == 0 && !instance_exists(boulderID))
{
    with (instance_create(x, y, obj_boulder))
    {
        image_xscale = other.image_xscale;
        other.boulderID = id;
        create_particle(x, y, UnknownEnum.Value_9, 0);
    }
    
    cooldown = 1000;
}

if (cooldown > 0)
    cooldown--;

enum UnknownEnum
{
    Value_9 = 9
}
