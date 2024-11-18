customer_x = 32;
customer_y = 18;
player_standx = 132;
content = 539;
spr_idle = 2263;
spr_happy = 2264;
gnome_id = 0;
xscale = 1;
image_speed = 0;
depth = 99;
image_index = 0;

if (collision_line(x, y, x, y + 400, obj_solid, false, true) != -4)
{
    while (!place_meeting(x, y + 1, obj_solid))
        y++;
}
