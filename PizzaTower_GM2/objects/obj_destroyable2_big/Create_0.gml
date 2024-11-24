hp = 2;

if (obj_player1.character == "P" && obj_player1.spotlight && obj_player1.ispeppino)
    sprite_index = spr_bigbreakable;

if ((obj_player1.character == "N" || !obj_player1.ispeppino) && obj_player1.spotlight)
    sprite_index = spr_halloweenbigblock;

depth = 1;
content = obj_null;
