var a;

a = random_range(-20, 20);

if (state == UnknownEnum.Value_138 && hsp != 0)
    alarm[1] = 5;

instance_create(x + a, y + a, obj_machalleffect);

enum UnknownEnum
{
    Value_138 = 138
}
