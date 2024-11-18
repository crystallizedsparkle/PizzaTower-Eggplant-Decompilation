if (inv_timer > 0)
{
    inv_timer--;
}
else if (inv_timer == 0)
{
    inv_timer = -1;
    invincible = false;
}

if (grounded && state != UnknownEnum.Value_137 && state != UnknownEnum.Value_138)
{
    if (jugglecount > 0)
        jugglecount--;
    else
        jugglecount = 0;
}

if (colliding)
{
    scr_collide();
}
else
{
    x += hsp;
    y += vsp;
    trace(colliding, ", Hsp: ", hsp, "Vsp: ", vsp);
}

enum UnknownEnum
{
    Value_137 = 137,
    Value_138
}
