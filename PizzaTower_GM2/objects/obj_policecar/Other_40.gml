if (state != UnknownEnum.Value_152)
    exit;

if (!instance_exists(obj_fadeout))
{
    scr_soundeffect(76);
    
    with (instance_create(x, y, obj_fadeout))
        roomreset = true;
}

enum UnknownEnum
{
    Value_152 = 152
}
