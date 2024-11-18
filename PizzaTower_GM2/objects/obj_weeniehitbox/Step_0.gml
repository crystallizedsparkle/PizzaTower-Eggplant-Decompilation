if (!instance_exists(baddieID) || baddieID.state != UnknownEnum.Value_5)
{
    instance_destroy();
    exit;
}

x = baddieID.x;
y = baddieID.y;
image_xscale = baddieID.image_xscale;

enum UnknownEnum
{
    Value_5 = 5
}
