if (state == states.golf)
    exit;

create_particle(x, y, particles.balloonpop, 0);
vsp = -14;
kicked = false;

with (other)
{
    visible = false;
    x = -9999;
    y = -9999;
    respawn = 100;
}

enum UnknownEnum
{
    Value_6 = 6,
    Value_148 = 148
}
