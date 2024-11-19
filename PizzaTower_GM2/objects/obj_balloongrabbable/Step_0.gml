if (cooldown > 0)
{
    cooldown--;
    active = false;
}
else if (!active)
{
    active = true;
    create_particle(x, y, particles.genericpoofeffect, 0);
}

visible = active;

enum UnknownEnum
{
    Value_9 = 9
}
