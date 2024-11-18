if (!instance_exists(baddieID))
{
    instance_destroy();
    exit;
}

x = baddieID.x + (baddieID.image_xscale * 48);
y = baddieID.y + 48;
image_xscale = baddieID.image_xscale;

if (baddieID.state != UnknownEnum.Value_238)
    instance_destroy();

enum UnknownEnum
{
    Value_238 = 238
}
