with (other)
{
    if (key_up && grounded && ((state == states.ratmount && brick) || state == states.normal || state == states.mach1 || state == states.mach2 || state == states.pogo || state == states.mach3 || state == states.Sjumpprep) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_fadeout) && state != states.taxi && ((obj_player1.spotlight && object_index == obj_player1) || (!obj_player1.spotlight && object_index == obj_player2)))
    {
        with (other)
        {
            instance_create(x, y, obj_genericpoofeffect);
            obj_player1.visible = false;
            obj_player1.sprite_index = obj_player1.spr_idle;
            obj_player1.hsp = 0;
            obj_player1.vsp = 0;
            obj_player1.state = states.taxi;
            scr_soundeffect(sfx_taxi2);
            playerid = obj_player1;
            sprite_index = spr_taximove;
            hsp = 10;
            obj_player1.cutscene = true;
            
            if (global.coop)
            {
                obj_player2.sprite_index = obj_player2.spr_idle;
                scr_soundeffect(sfx_taxi2);
                playerid = obj_player2;
                sprite_index = spr_taximove;
                hsp = 10;
                obj_player2.visible = false;
                obj_player2.hsp = 0;
                obj_player2.vsp = 0;
                obj_player2.state = states.taxi;
                obj_player2.cutscene = true;
            }
        }
    }
}

