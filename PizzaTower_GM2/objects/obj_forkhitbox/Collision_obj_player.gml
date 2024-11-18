var h;

if (instance_exists(ID) && ID.object_index == obj_badrat && other.state == UnknownEnum.Value_5)
    exit;

h = other.hurted;
scr_hurtplayer(other);

if (h == false && other.hurted)
    instance_create(round((x + other.x) / 2), round((y + other.y) / 2), obj_parryeffect);

enum UnknownEnum
{
    Value_5 = 5
}
