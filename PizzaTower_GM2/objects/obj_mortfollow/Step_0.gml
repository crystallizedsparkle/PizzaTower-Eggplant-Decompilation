if (obj_player1.spotlight)
    playerid = obj_player1;
else
    playerid = obj_player2;

if (!playerid.mort)
    visible = true;
else
    visible = false;

if (room == rank_room)
    visible = false;

image_speed = 0.35;

if (obj_player1.hsp != 0)
    sprite_index = spr_mortwalk;
else
    sprite_index = spr_mortidle;

depth = -6;

if (!global.mort)
    instance_destroy();
