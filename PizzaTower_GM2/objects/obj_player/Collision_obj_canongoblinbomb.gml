if (hurted == false && other.grounded == false && state != states.backbreaker && state != states.parry)
{
    instance_destroy(other);
    instance_create(x, y, obj_canonexplosion);
}

enum UnknownEnum
{
    Value_84 = 84,
    Value_147 = 147
}
