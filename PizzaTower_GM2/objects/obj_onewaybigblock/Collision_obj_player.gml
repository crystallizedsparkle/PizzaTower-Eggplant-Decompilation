var _col;

if (other.state != states.hit && other.state != states.chainsaw && other.state != states.gotoplayer)
{
    _col = collision_line(x + (35 * image_xscale), y + (16 * image_yscale), other.x, other.y, obj_solid, false, true);
    
    if (_col == -4)
        instance_destroy();
}

enum UnknownEnum
{
    Value_61 = 61,
    Value_137 = 137,
    Value_186 = 186
}
