x += hsp;

if (hsp != 0)
{
    dust += 1;
    
    if (dust == 40)
    {
        dust = 0;
        create_particle(x, y + 43, UnknownEnum.Value_1);
    }
}

enum UnknownEnum
{
    Value_1 = 1
}
