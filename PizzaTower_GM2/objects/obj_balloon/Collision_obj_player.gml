if (other.state == states.gotoplayer)
    exit;

create_particle(x, y, particles.balloonpop, 0);
other.vsp = -14;
other.jumpstop = true;
visible = false;
x = -100;
y = -100;
respawn = 100;

if (other.state == states.jump)
    other.sprite_index = other.spr_machfreefall;

if (other.state == states.climbwall)
{
    other.sprite_index = other.spr_machfreefall;
    other.state = states.jump;
}

enum UnknownEnum
{
    Value_6 = 6,
    Value_37 = 37,
    Value_92 = 92,
    Value_186 = 186
}
