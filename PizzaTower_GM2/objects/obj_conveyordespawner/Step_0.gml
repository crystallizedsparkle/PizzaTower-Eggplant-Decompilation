var i, b;

for (i = 0; i < array_length(objectlist); i++)
{
    b = objectlist[i];
    
    with (instance_place(x, y, b))
    {
        create_particle(x, y, UnknownEnum.Value_9);
        instance_destroy();
    }
}

enum UnknownEnum
{
    Value_9 = 9
}
