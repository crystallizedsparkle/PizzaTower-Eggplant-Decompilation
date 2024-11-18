if (cooldown == 0 && other.state == UnknownEnum.Value_111)
{
    instance_destroy(obj_barrel);
    instance_create(x + 50, y - 50, obj_barrel);
    cooldown = 10;
}

enum UnknownEnum
{
    Value_111 = 111
}
