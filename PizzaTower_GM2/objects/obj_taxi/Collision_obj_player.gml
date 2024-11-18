with (other)
{
    if (key_up && grounded && ((state == UnknownEnum.Value_191 && brick) || state == UnknownEnum.Value_0 || state == UnknownEnum.Value_103 || state == UnknownEnum.Value_104 || state == UnknownEnum.Value_58 || state == UnknownEnum.Value_121 || state == UnknownEnum.Value_99) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_fadeout) && state != UnknownEnum.Value_119 && ((obj_player1.spotlight == true && object_index == obj_player1) || (obj_player1.spotlight == false && object_index == obj_player2)))
    {
        with (other)
        {
            instance_create(x, y, obj_genericpoofeffect);
            obj_player1.visible = false;
            obj_player1.sprite_index = obj_player1.spr_idle;
            obj_player1.hsp = 0;
            obj_player1.vsp = 0;
            obj_player1.state = UnknownEnum.Value_119;
            scr_soundeffect(94);
            playerid = 324;
            sprite_index = spr_taximove;
            hsp = 10;
            obj_player1.cutscene = true;
            
            if (global.coop == true)
            {
                obj_player2.sprite_index = obj_player2.spr_idle;
                scr_soundeffect(94);
                playerid = 323;
                sprite_index = spr_taximove;
                hsp = 10;
                obj_player2.visible = false;
                obj_player2.hsp = 0;
                obj_player2.vsp = 0;
                obj_player2.state = UnknownEnum.Value_119;
                obj_player2.cutscene = true;
            }
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_58 = 58,
    Value_99 = 99,
    Value_103 = 103,
    Value_104,
    Value_119 = 119,
    Value_121 = 121,
    Value_191 = 191
}
