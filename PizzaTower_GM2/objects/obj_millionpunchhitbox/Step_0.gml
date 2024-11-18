if (!instance_exists(baddieID))
{
    instance_destroy();
    exit;
}

x = baddieID.x;
y = baddieID.y;
image_xscale = baddieID.image_xscale;

if (col_buffer > 0)
{
    col_buffer--;
}
else if (col_buffer == 0)
{
    col_buffer = -1;
    collisioned = false;
}

if (baddieID.state != UnknownEnum.Value_166 && baddieID.state != UnknownEnum.Value_61)
    instance_destroy();

enum UnknownEnum
{
    Value_61 = 61,
    Value_166 = 166
}