if (!hurted  && !other.grounded && state != states.backbreaker && state != states.parry)
{
    instance_destroy(other);
    instance_create(x, y, obj_canonexplosion);
}

