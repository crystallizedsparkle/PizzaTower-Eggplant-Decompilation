function scr_player_hook()
{
    if (key_jump)
    {
        state = UnknownEnum.Value_92;
        sprite_index = spr_jump;
        image_index = 0;
        vsp = -11;
        jumpstop = false;
    }
}

enum UnknownEnum
{
    Value_92 = 92
}