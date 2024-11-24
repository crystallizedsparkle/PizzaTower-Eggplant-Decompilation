if (respawn > 0)
    respawn--;

if (respawn == 0 && !visible)
{
    visible = true;
    x = xstart;
    y = ystart;
}
