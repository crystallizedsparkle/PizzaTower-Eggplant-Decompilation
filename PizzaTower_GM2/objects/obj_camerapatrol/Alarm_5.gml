if (patroltimer > 0)
{
    patroltimer--;
    alarm[5] = 60;
}
else
{
    patrolfound = false;
    state = UnknownEnum.Value_80;
    sprite_index = spr_teeth_alert;
    image_index = 0;
    scr_monster_activate();
}

enum UnknownEnum
{
    Value_80 = 80
}
