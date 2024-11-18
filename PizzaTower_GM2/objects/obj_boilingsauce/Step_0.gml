var playerid, _pindex;

if (room == rm_editor)
    exit;

playerid = instance_place(x, y - 1, obj_player);

with (playerid)
{
    if (character == "V")
    {
        scr_hurtplayer(id);
    }
    else if (state != UnknownEnum.Value_3 && state != UnknownEnum.Value_89 && state != UnknownEnum.Value_31 && state != UnknownEnum.Value_186)
    {
        _pindex = (object_index == obj_player1) ? 0 : 1;
        GamepadSetVibration(_pindex, 1, 1, 0.85);
        
        if (state != UnknownEnum.Value_9)
            tv_push_prompt_once(tv_create_prompt("This is the fireass transformation text", UnknownEnum.Value_2, 550, 3), "fireass");
        
        state = UnknownEnum.Value_9;
        vsp = -20;
        sprite_index = spr_fireass;
        image_index = 0;
        movespeed = hsp;
        
        if (!audio_is_playing(sfx_scream5))
            scr_soundeffect(57);
    }
}

enum UnknownEnum
{
    Value_2 = 2,
    Value_3,
    Value_9 = 9,
    Value_31 = 31,
    Value_89 = 89,
    Value_186 = 186
}
