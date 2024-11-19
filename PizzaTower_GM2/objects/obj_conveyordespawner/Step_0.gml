var i, b;

for (i = 0; i < array_length(objectlist); i++)
{
    b = objectlist[i];
    
    with (instance_place(x, y, b))
    {
        create_particle(x, y, particles.genericpoofeffect);
        instance_destroy();
    }
}

enum UnknownEnum
{
    Value_9 = 9
}
