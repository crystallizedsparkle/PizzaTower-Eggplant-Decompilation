if (place_meeting(x, y + 1, obj_player) && obj_player.vsp < 0 && global.pizzacoin >= 4 && image_speed == 0)
{
    scr_soundeffect(87);
    global.pizzacoin -= 4;
    image_speed = 0.35;
    
    if (global.snickchallenge)
        global.SAGEshotgunsnicknumber += 1;
}
