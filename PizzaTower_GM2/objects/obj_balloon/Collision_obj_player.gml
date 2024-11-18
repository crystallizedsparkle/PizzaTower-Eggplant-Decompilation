if (other.state == UnknownEnum.Value_186)
    exit;

create_particle(x, y, UnknownEnum.Value_6, 0);
other.vsp = -14;
other.jumpstop = true;
visible = false;
x = -100;
y = -100;
respawn = 100;

if (other.state == UnknownEnum.Value_92)
    other.sprite_index = other.spr_machfreefall;

if (other.state == UnknownEnum.Value_37)
{
    other.sprite_index = other.spr_machfreefall;
    other.state = UnknownEnum.Value_92;
}

enum UnknownEnum
{
    Value_6 = 6,
    Value_37 = 37,
    Value_92 = 92,
    Value_186 = 186
}
