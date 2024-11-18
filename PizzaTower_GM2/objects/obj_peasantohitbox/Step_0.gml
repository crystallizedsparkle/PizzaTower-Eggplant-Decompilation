if (!instance_exists(ID))
{
    instance_destroy();
    exit;
}

if (ID.state != UnknownEnum.Value_128)
{
    ID.hitboxcreate = false;
    instance_destroy();
}

x = ID.x + (ID.image_xscale * 12);
y = ID.y;
image_xscale = ID.image_xscale;

enum UnknownEnum
{
    Value_128 = 128
}
