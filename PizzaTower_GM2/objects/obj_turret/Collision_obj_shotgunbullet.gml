if (invtime <= 0)
{
    invtime = 15;
    hp--;
    scr_soundeffect(46);
}

instance_destroy(other);
