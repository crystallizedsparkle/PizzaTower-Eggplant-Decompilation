with (create_afterimage(x, y, sprite_index, 0))
    image_xscale = other.image_xscale;

if (grounded == true)
{
    with (instance_create(x, y, obj_dashcloud2))
        image_xscale = other.image_xscale;
}

if (state == UnknownEnum.Value_125)
    alarm[4] = 5;

enum UnknownEnum
{
    Value_125 = 125
}
