if (instance_exists(obj_pepperman))
{
    if (obj_pepperman.hp <= 6 && !start)
    {
        alarm[0] = 500;
        start = true;
    }
}
else
{
    instance_destroy();
}
