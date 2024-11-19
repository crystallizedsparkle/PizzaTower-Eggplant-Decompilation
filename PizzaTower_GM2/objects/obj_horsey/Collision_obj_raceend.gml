var x1, y1;

hsp = 0;
vsp = 0;
x1 = other.x + (other.sprite_width / 2);
y1 = (other.y + other.sprite_height) - 34;
x = Approach(x, x1, spd);
y = Approach(y, y1, spd);

if (x == x1 && y == y1 && state != states.gameover)
{
    spd = 0;
    other.horseyfinish = true;
    state = states.finishingblow;
    global.horse = false;
}

enum UnknownEnum
{
    Value_6 = 6,
    Value_89 = 89
}
