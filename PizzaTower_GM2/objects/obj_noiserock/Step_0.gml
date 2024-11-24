if (!place_meeting(x, y + 1, obj_solid) && vsp > 0 && !hit)
    falling = true;

if (place_meeting(x, y + 1, obj_solid) && falling)
    falling = false;

if (!place_meeting(x, y, obj_noisetrap_rock))
    hsp = 0;

if (falling && !hit)
    hsp = 0;

scr_collide();
