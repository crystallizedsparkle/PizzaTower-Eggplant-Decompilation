global.levelcomplete = true;
scr_playerreset();

with (obj_player)
{
    targetDoor = "A";
    targetRoom = 58;
    room = rm_levelselect;
    x = -100;
    y = -100;
    state = states.titlescreen;
    image_blend = c_white;
}

enum UnknownEnum
{
    Value_18 = 18
}
