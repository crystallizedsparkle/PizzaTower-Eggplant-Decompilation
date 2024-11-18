function scr_collide_destructibles()
{
    var i, _obj_player, num, k, vy, _inst, j, _max, _destroyed;
    
    for (i = 0; i < 2; i++)
    {
        _obj_player = asset_get_index(concat("obj_player", i + 1));
        
        with (_obj_player)
        {
            if ((state == UnknownEnum.Value_92 && sprite_index == spr_playerN_noisebombspinjump) || state == UnknownEnum.Value_165 || state == UnknownEnum.Value_31 || state == UnknownEnum.Value_187 || state == UnknownEnum.Value_198 || (state == UnknownEnum.Value_58 && pogochargeactive == true))
            {
                with (instance_place(x + xscale, y, obj_destructibles))
                {
                    GamepadSetVibration(0, 0.8, 0.8, 0.5);
                    instance_destroy();
                }
                
                with (instance_place(x + hsp + xscale, y, obj_destructibles))
                {
                    GamepadSetVibration(0, 0.8, 0.8, 0.5);
                    instance_destroy();
                }
                
                with (instance_place(x, y + vsp + 1, obj_destructibles))
                {
                    GamepadSetVibration(0, 0.8, 0.8, 0.5);
                    instance_destroy();
                }
                
                with (instance_place(x, (y + vsp) - 1, obj_destructibles))
                {
                    GamepadSetVibration(0, 0.8, 0.8, 0.5);
                    instance_destroy();
                }
                
                with (instance_place(x, y + 1, obj_destructibles))
                {
                    GamepadSetVibration(0, 0.8, 0.8, 0.5);
                    instance_destroy();
                }
                
                with (instance_place(x, y - 1, obj_destructibles))
                {
                    GamepadSetVibration(0, 0.8, 0.8, 0.5);
                    instance_destroy();
                }
            }
            
            if (state == UnknownEnum.Value_5)
            {
                with (instance_place(x + xscale, y, obj_rollblock))
                    instance_destroy();
            }
            
            if (state == UnknownEnum.Value_121 && sprite_index == spr_player_fightball)
            {
                with (instance_place(x + xscale, y, obj_fightballblock))
                    instance_destroy();
            }
            
            if (state == UnknownEnum.Value_193 && place_meeting(x + hsp, y, obj_gustavodestroyable))
            {
                with (instance_place(x + hsp, y, obj_gustavodestroyable))
                {
                    GamepadSetVibration(0, 0.8, 0.8, 0.5);
                    instance_destroy();
                }
            }
            
            if (state == UnknownEnum.Value_211 || state == UnknownEnum.Value_34 || ratmount_movespeed == 12 || state == UnknownEnum.Value_259 || state == UnknownEnum.Value_201 || state == UnknownEnum.Value_80 || state == UnknownEnum.Value_42 || state == UnknownEnum.Value_193 || state == UnknownEnum.Value_43 || state == UnknownEnum.Value_21 || state == UnknownEnum.Value_53 || state == UnknownEnum.Value_184 || state == UnknownEnum.Value_70 || state == UnknownEnum.Value_124 || state == UnknownEnum.Value_94 || state == UnknownEnum.Value_20 || sprite_index == spr_barrelroll || state == UnknownEnum.Value_41 || state == UnknownEnum.Value_121 || state == UnknownEnum.Value_47 || state == UnknownEnum.Value_65 || state == UnknownEnum.Value_38 || state == UnknownEnum.Value_48 || state == UnknownEnum.Value_5 || state == UnknownEnum.Value_19 || state == UnknownEnum.Value_153)
            {
                if (place_meeting(x + hsp, y, obj_destructibles))
                {
                    if (character != "V")
                    {
                        with (instance_place(x + hsp, y, obj_destructibles))
                        {
                            GamepadSetVibration(0, 0.8, 0.8, 0.5);
                            instance_destroy();
                        }
                        
                        if (state == UnknownEnum.Value_104)
                            machpunchAnim = true;
                    }
                }
            }
            
            if (state == UnknownEnum.Value_107 && thrown == true)
            {
                if (place_meeting(x - hsp, y, obj_destructibles))
                {
                    with (instance_place(x - hsp, y, obj_destructibles))
                    {
                        GamepadSetVibration(0, 0.8, 0.8, 0.5);
                        instance_destroy();
                    }
                }
            }
            
            if ((state == UnknownEnum.Value_47 || sprite_index == spr_lonegustavo_groundpoundstart || sprite_index == spr_lonegustavo_groundpound || state == UnknownEnum.Value_254 || state == UnknownEnum.Value_10 || state == UnknownEnum.Value_165 || state == UnknownEnum.Value_76 || state == UnknownEnum.Value_19 || (state == UnknownEnum.Value_54 && bombup_dir == 1)) && vsp > 0)
            {
                if (place_meeting(x, y + 1, obj_destructibles))
                {
                    with (instance_place(x, y + 1, obj_destructibles))
                    {
                        GamepadSetVibration(0, 0.8, 0.8, 0.5);
                        instance_destroy();
                    }
                    
                    if (state == UnknownEnum.Value_10 || state == UnknownEnum.Value_254)
                    {
                        with (instance_place(x, y + 1, obj_tntblock))
                        {
                            GamepadSetVibration(0, 0.8, 0.8, 0.5);
                            instance_destroy();
                        }
                        
                        if (vsp > -11)
                            vsp = -11;
                        
                        jumpstop = false;
                    }
                }
            }
            
            num = instance_place_list(x, y + 1, 592, global.instancelist, false);
            
            for (k = 0; k < num; k++)
            {
                with (ds_list_find_value(global.instancelist, k))
                {
                    falling = true;
                    
                    if (falling == true)
                        image_speed = 0.35;
                }
            }
            
            ds_list_clear(global.instancelist);
            
            if (vsp <= 0.5 && (state == UnknownEnum.Value_92 || state == UnknownEnum.Value_192 || state == UnknownEnum.Value_121 || state == UnknownEnum.Value_104 || state == UnknownEnum.Value_265 || state == UnknownEnum.Value_58 || (state == UnknownEnum.Value_54 && bombup_dir == -1) || state == UnknownEnum.Value_80 || state == UnknownEnum.Value_37 || state == UnknownEnum.Value_9 || state == UnknownEnum.Value_97 || state == UnknownEnum.Value_22 || state == UnknownEnum.Value_121 || (state == UnknownEnum.Value_80 && (sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend))))
            {
                vy = -1;
                
                if (state == UnknownEnum.Value_80 && (sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend))
                    vy = vsp;
                
                if (place_meeting(x, y + vy, obj_destructibles))
                {
                    with (instance_place(x, y + vy, obj_destructibles))
                    {
                        GamepadSetVibration(0, 0.6, 0.6, 0.5);
                        instance_destroy();
                        
                        with (other)
                        {
                            if (state != UnknownEnum.Value_97 && state != UnknownEnum.Value_80 && state != UnknownEnum.Value_37)
                                vsp = 0;
                            
                            if (state == UnknownEnum.Value_97)
                                vsp = -11;
                        }
                    }
                }
            }
            
            if (vsp >= 0 && (state == UnknownEnum.Value_108 || state == UnknownEnum.Value_76 || state == UnknownEnum.Value_111 || state == UnknownEnum.Value_197 || (state == UnknownEnum.Value_165 && vsp >= 10)))
            {
                if (place_meeting(x, y + vsp + 2, obj_destructibles))
                {
                    with (instance_place(x, y + vsp + 2, obj_destructibles))
                    {
                        with (_obj_player)
                        {
                            if (place_meeting(x, y + vsp + 2, obj_bigdestructibles))
                            {
                                _inst = instance_place(x, y + vsp + 2, obj_bigdestructibles);
                                
                                if (instance_exists(_inst))
                                {
                                    j = 0;
                                    _max = 256;
                                    
                                    while (!place_meeting(x, y + 1, obj_bigdestructibles))
                                    {
                                        y += 1;
                                        j++;
                                        
                                        if (j >= _max)
                                            break;
                                    }
                                }
                                
                                if (freefallsmash <= 10 && state != UnknownEnum.Value_165 && !isgustavo)
                                {
                                    if (shotgunAnim == false)
                                        sprite_index = spr_bodyslamland;
                                    else
                                        sprite_index = spr_shotgunjump2;
                                    
                                    state = UnknownEnum.Value_111;
                                    image_index = 0;
                                }
                            }
                        }
                        
                        instance_destroy();
                    }
                }
            }
            
            if (state == UnknownEnum.Value_108 || state == UnknownEnum.Value_111 || state == UnknownEnum.Value_165)
            {
                if (place_meeting(x, y + 1, obj_metalblock) && (freefallsmash >= 10 || state == UnknownEnum.Value_165))
                {
                    with (instance_place(x, y + 1, obj_metalblock))
                        instance_destroy();
                }
            }
            
            if (state == UnknownEnum.Value_102 || state == UnknownEnum.Value_65 || state == UnknownEnum.Value_104 || state == UnknownEnum.Value_80)
            {
                with (obj_destructibles)
                {
                    if (place_meeting(x - _obj_player.hsp, y, _obj_player))
                    {
                        _destroyed = false;
                        
                        with (_obj_player)
                        {
                            if (place_meeting(x + hsp, y, obj_bigdestructibles) && state != UnknownEnum.Value_102 && state != UnknownEnum.Value_104 && state != UnknownEnum.Value_65)
                            {
                                state = UnknownEnum.Value_6;
                                sprite_index = spr_player_lungehit;
                                image_index = 0;
                                instance_destroy(other);
                                _destroyed = true;
                            }
                            else if (other.object_index != obj_bigdestructibles)
                            {
                                instance_destroy(other);
                                _destroyed = true;
                            }
                            
                            if (_destroyed && state == UnknownEnum.Value_43)
                                hit_connected = true;
                        }
                    }
                }
            }
        }
    }
}

enum UnknownEnum
{
    Value_5 = 5,
    Value_6,
    Value_9 = 9,
    Value_10,
    Value_19 = 19,
    Value_20,
    Value_21,
    Value_22,
    Value_31 = 31,
    Value_34 = 34,
    Value_37 = 37,
    Value_38,
    Value_41 = 41,
    Value_42,
    Value_43,
    Value_47 = 47,
    Value_48,
    Value_53 = 53,
    Value_54,
    Value_58 = 58,
    Value_65 = 65,
    Value_70 = 70,
    Value_76 = 76,
    Value_80 = 80,
    Value_92 = 92,
    Value_94 = 94,
    Value_97 = 97,
    Value_102 = 102,
    Value_104 = 104,
    Value_107 = 107,
    Value_108,
    Value_111 = 111,
    Value_121 = 121,
    Value_124 = 124,
    Value_153 = 153,
    Value_165 = 165,
    Value_184 = 184,
    Value_187 = 187,
    Value_192 = 192,
    Value_193,
    Value_197 = 197,
    Value_198,
    Value_201 = 201,
    Value_211 = 211,
    Value_254 = 254,
    Value_259 = 259,
    Value_265 = 265
}
