if (!instance_exists(ID))
    instance_destroy();

x = ID.x;
y = ID.y;
image_xscale = ID.image_xscale;
image_index = ID.image_index;

with (ID)
{
    if (state != UnknownEnum.Value_126 && state != UnknownEnum.Value_134)
    {
        hitboxcreate = false;
        instance_destroy(other);
    }
}

enum UnknownEnum
{
    Value_126 = 126,
    Value_134 = 134
}
