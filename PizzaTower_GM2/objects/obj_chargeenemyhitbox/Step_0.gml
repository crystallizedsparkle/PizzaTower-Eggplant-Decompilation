if (!instance_exists(baddieID) || !baddieID.thrown || baddieID.state != UnknownEnum.Value_138)
{
    instance_destroy();
    exit;
}

x = baddieID.x;
y = baddieID.y;
image_xscale = -baddieID.image_xscale;

enum UnknownEnum
{
    Value_138 = 138
}
