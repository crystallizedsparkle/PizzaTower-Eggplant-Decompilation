if (other.clowntimer <= 0)
{
    instance_create(x, y, obj_genericpoofeffect);
    other.movespeed = 10;
    other.state = states.mach2;
    other.skateboarding = true;
    other.clowntimer = 150;
}

enum UnknownEnum
{
    Value_104 = 104
}
