if (!other.active && active && other.id == webID)
{
    other.active = true;
    active = false;
    create_particle(other.x, other.y, particles.genericpoofeffect, 0);
}

enum UnknownEnum
{
    Value_9 = 9
}
