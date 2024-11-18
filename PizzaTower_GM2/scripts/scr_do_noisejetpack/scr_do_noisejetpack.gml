function scr_do_noisejetpack()
{
    if (global.noisejetpack && !grounded && key_jump && walljumpbuffer <= 0)
    {
        input_buffer_jump = 8;
        trace("noisejetpack");
        state = UnknownEnum.Value_215;
        sprite_index = spr_playerN_doublejump;
        image_index = 0;
        vsp = -11;
    }
}

enum UnknownEnum
{
    Value_215 = 215
}
