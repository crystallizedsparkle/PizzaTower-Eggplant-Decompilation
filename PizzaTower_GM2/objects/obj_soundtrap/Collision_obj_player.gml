with (other)
{
    if (state != UnknownEnum.Value_186 && state != UnknownEnum.Value_9)
    {
        scr_soundeffect(57);
        image_index = 0;
        state = UnknownEnum.Value_9;
        vsp = -21;
        sprite_index = spr_scaredjump1;
        scr_monster_activate();
    }
}

enum UnknownEnum
{
    Value_9 = 9,
    Value_186 = 186
}
