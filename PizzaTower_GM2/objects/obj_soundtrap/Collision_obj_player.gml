with (other)
{
    if (state != states.gotoplayer && state != states.fireass)
    {
        scr_soundeffect(57);
        image_index = 0;
        state = states.fireass;
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
