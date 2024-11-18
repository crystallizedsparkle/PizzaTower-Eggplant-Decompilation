if (!instance_exists(ID))
    instance_destroy();

if (instance_exists(ID))
{
    x = ID.x;
    y = ID.y;
    image_xscale = ID.image_xscale;
    image_index = ID.image_index;
    
    with (ID)
    {
        if (state != UnknownEnum.Value_141 && state != UnknownEnum.Value_125)
        {
            hitboxcreate = false;
            instance_destroy(other);
        }
    }
}

enum UnknownEnum
{
    Value_125 = 125,
    Value_141 = 141
}
