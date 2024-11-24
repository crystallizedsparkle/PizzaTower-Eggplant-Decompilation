if (global.panic)
{
    delay--;
    
    if (delay <= 0)
    {
        instance_create(x, y, obj_icicle);
        delay = 300;
    }
}
