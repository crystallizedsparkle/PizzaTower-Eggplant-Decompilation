if (other.state != UnknownEnum.Value_61 && other.skateboarding == false)
{
    instance_create(x, y, obj_genericpoofeffect);
    other.movespeed = 10;
    other.state = UnknownEnum.Value_104;
    other.skateboarding = true;
    tv_push_prompt_once(tv_create_prompt("This is the clown transformation text", UnknownEnum.Value_2, 1197, 3), "skateboard");
}

enum UnknownEnum
{
    Value_2 = 2,
    Value_61 = 61,
    Value_104 = 104
}
