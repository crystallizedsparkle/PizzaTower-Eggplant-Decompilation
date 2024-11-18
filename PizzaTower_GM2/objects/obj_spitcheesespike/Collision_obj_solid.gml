instance_destroy();

repeat (3)
{
    with (create_debris(x, y, 1136))
    {
        vsp = random_range(-5, 0);
        hsp = random_range(-3, 3);
    }
}
