if (hurted == false && other.grounded == false && state != UnknownEnum.Value_84 && state != UnknownEnum.Value_147)
{
    instance_destroy(other);
    instance_create(x, y, obj_canonexplosion);
}

enum UnknownEnum
{
    Value_84 = 84,
    Value_147 = 147
}
