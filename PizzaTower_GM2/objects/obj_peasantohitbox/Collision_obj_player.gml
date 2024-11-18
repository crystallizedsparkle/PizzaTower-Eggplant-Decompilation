var _pindex;

with (other)
{
    if (character == "V")
    {
        scr_hurtplayer(id);
    }
    else if (state != UnknownEnum.Value_121 && (state != UnknownEnum.Value_61 || tauntstoredstate != UnknownEnum.Value_121) && state != UnknownEnum.Value_3 && state != UnknownEnum.Value_89 && state != UnknownEnum.Value_31 && state != UnknownEnum.Value_186)
    {
        _pindex = (object_index == obj_player1) ? 0 : 1;
        GamepadSetVibration(_pindex, 1, 1, 0.85);
        state = UnknownEnum.Value_9;
        vsp = -25;
        sprite_index = spr_fireass;
        image_index = 0;
        
        if (!audio_is_playing(sfx_scream5))
            scr_soundeffect(57);
    }
}

enum UnknownEnum
{
    Value_3 = 3,
    Value_9 = 9,
    Value_31 = 31,
    Value_61 = 61,
    Value_89 = 89,
    Value_121 = 121,
    Value_186 = 186
}
