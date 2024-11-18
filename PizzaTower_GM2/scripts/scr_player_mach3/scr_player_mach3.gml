function scr_player_mach3()
{
    var _railinst, _bump;
    
    switch (character)
    {
        case "P":
            if (windingAnim < 2000)
                windingAnim++;
            
            if (place_meeting(x, y + 1, obj_railparent))
            {
                _railinst = instance_place(x, y + 1, obj_railparent);
                railmovespeed = _railinst.movespeed;
                raildir = _railinst.dir;
            }
            
            hsp = (xscale * movespeed) + (railmovespeed * raildir);
            
            if (grounded)
            {
                if ((scr_slope() && hsp != 0) && movespeed > 10 && movespeed < 18)
                    scr_player_addslopemomentum(0.1, 0.2);
            }
            
            if (move == xscale && grounded)
            {
                if (movespeed < 20)
                {
                    if (mach4mode == false)
                        movespeed += 0.025;
                    else
                        movespeed += 0.1;
                }
            }
            
            mach2 = 100;
            momemtum = true;
            move = key_right + key_left;
            move2 = key_right2 + key_left2;
            
            if (fightball == true && global.coop == true)
            {
                if (object_index == obj_player1)
                {
                    x = obj_player2.x;
                    y = obj_player2.y;
                }
                
                if (object_index == obj_player2)
                {
                    x = obj_player1.x;
                    y = obj_player1.y;
                }
            }
            
            if (sprite_index == spr_crazyrun)
            {
                if (flamecloud_buffer > 0)
                {
                    flamecloud_buffer--;
                }
                else
                {
                    flamecloud_buffer = 10;
                    
                    with (instance_create(x, y, obj_dashcloud))
                    {
                        image_xscale = other.xscale;
                        sprite_index = spr_flamecloud;
                    }
                }
            }
            
            crouchslideAnim = true;
            
            if (!key_jump2 && jumpstop == false && vsp < 0.5)
            {
                vsp /= 20;
                jumpstop = true;
            }
            
            if (grounded && vsp > 0)
                jumpstop = false;
            
            if (input_buffer_jump < 8 && sprite_index != spr_mach3jump && grounded && !(move == 1 && xscale == -1) && !(move == -1 && xscale == 1))
            {
                scr_soundeffect(12);
                
                if (sprite_index != spr_fightball)
                {
                    image_index = 0;
                    sprite_index = spr_mach3jump;
                }
                
                if (character == "P")
                    vsp = -11;
                else
                    vsp = -13;
            }
            
            if (fightball == false)
            {
                if (sprite_index == spr_mach3jump && floor(image_index) == (image_number - 1))
                    sprite_index = spr_mach4;
                
                if (floor(image_index) == (image_number - 1) && (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_dashpadmach))
                    sprite_index = spr_mach4;
                
                if (sprite_index == spr_mach2jump && grounded && vsp > 0)
                    sprite_index = spr_mach4;
                
                if (movespeed > 16 && sprite_index != spr_crazyrun && sprite_index != spr_player_Sjumpcancelstart && sprite_index != spr_taunt)
                {
                    mach4mode = true;
                    flash = true;
                    sprite_index = spr_crazyrun;
                    
                    with (create_debris(x, y, 1141))
                    {
                        hsp = random_range(-5, 5);
                        vsp = random_range(-10, 10);
                    }
                }
                else if (movespeed <= 16 && sprite_index == spr_crazyrun)
                {
                    sprite_index = spr_mach4;
                }
            }
            
            if (sprite_index == spr_crazyrun && !instance_exists(crazyruneffectid))
            {
                with (instance_create(x, y, obj_crazyrunothereffect))
                {
                    playerid = other.object_index;
                    other.crazyruneffectid = id;
                }
            }
            
            if (sprite_index == spr_mach4 || sprite_index == spr_fightball)
                image_speed = 0.4;
            else if (sprite_index == spr_crazyrun)
                image_speed = 0.75;
            else if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_dashpadmach)
                image_speed = 0.4;
            
            if (key_jump)
                input_buffer_jump = 0;
            
            if (((!key_attack && fightball == false && !launched) && sprite_index != spr_dashpadmach && grounded && (character == "P" || character == "N")) || ((character == "S" && (move == 0 || move != xscale) && grounded) && fightball == false))
            {
                sprite_index = spr_machslidestart;
                scr_soundeffect(89);
                state = UnknownEnum.Value_105;
                image_index = 0;
                launched = false;
            }
            
            if (move == -xscale && grounded && !launched && (character == "P" || character == "N") && fightball == false && sprite_index != spr_dashpadmach)
            {
                scr_soundeffect(86);
                sprite_index = spr_mach3boost;
                state = UnknownEnum.Value_105;
                image_index = 0;
            }
            
            if (key_down && fightball == false)
            {
                particle_set_scale(UnknownEnum.Value_5, xscale, 1);
                create_particle(x, y, UnknownEnum.Value_5, 0);
                flash = false;
                state = UnknownEnum.Value_5;
                image_index = 0;
                vsp = 10;
                
                if (!grounded)
                    sprite_index = spr_player_mach2jump;
                else
                    sprite_index = spr_player_machroll;
                
                if (character == "V")
                    sprite_index = spr_playerV_divekickstart;
            }
            
            if ((!grounded && (place_meeting(x + hsp, y, obj_solid) || scr_solid_slope(x + hsp, y)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_mach3solid) && !place_meeting(x + hsp, y, obj_metalblock)) || (grounded && (place_meeting(x + sign(hsp), y - 16, obj_solid) || scr_solid_slope(x + sign(hsp), y - 16)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_mach3solid) && !place_meeting(x + hsp, y, obj_metalblock) && place_meeting(x, y + 1, obj_slope)))
            {
                wallspeed = movespeed;
                
                if (vsp > 0)
                    wallspeed -= vsp;
                
                state = UnknownEnum.Value_37;
            }
            
            if (!grounded && place_meeting(x + sign(hsp), y, obj_climbablewall) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_metalblock))
            {
                wallspeed = movespeed;
                state = UnknownEnum.Value_37;
            }
            
            if (key_slap2)
            {
                sprite_index = spr_suplexdash;
                suplexmove = true;
                suplexdashsnd = audio_play_sound(sfx_suplexdash, 1, 0);
                sfx_gain(suplexdashsnd);
                state = UnknownEnum.Value_42;
                
                if (movespeed < 5)
                    movespeed = 5;
                
                image_index = 0;
                flash = true;
            }
            
            if (key_shoot2 && shotgunAnim == true)
                scr_shotgunshoot();
            
            if ((scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_mach3solid)) && !scr_slope() && (scr_solid_slope(x + sign(hsp), y) || place_meeting(x + sign(hsp), y, obj_solid)) && !place_meeting(x + sign(hsp), y, obj_metalblock) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_climbablewall) && grounded)
            {
                _bump = ledge_bump((vsp >= 0) ? 32 : 22);
                
                if (_bump)
                {
                    with (obj_camera)
                    {
                        shake_mag = 20;
                        shake_mag_acc = 40 / room_speed;
                    }
                    
                    with (obj_baddie)
                    {
                        if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
                        {
                            stun = true;
                            alarm[0] = 200;
                            ministun = false;
                            vsp = -5;
                            hsp = 0;
                        }
                    }
                    
                    if (!fightball)
                    {
                        sprite_index = spr_hitwall;
                        scr_soundeffect(27);
                        scr_soundeffect(28);
                        hsp = 0;
                        flash = false;
                        state = UnknownEnum.Value_106;
                        hsp = -6 * xscale;
                        vsp = -6;
                        mach2 = 0;
                        image_index = 0;
                        instance_create(x + 10, y + 10, obj_bumpeffect);
                    }
                    else
                    {
                        fightball = false;
                        
                        with (obj_player)
                        {
                            sprite_index = spr_hitwall;
                            scr_soundeffect(27);
                            scr_soundeffect(28);
                            hsp = 0;
                            flash = false;
                            state = UnknownEnum.Value_106;
                            hsp = -6 * xscale;
                            vsp = -6;
                            mach2 = 0;
                            image_index = 0;
                            instance_create(x + 10, y + 10, obj_bumpeffect);
                        }
                    }
                }
            }
            
            break;
        
        case "V":
            if (windingAnim < 2000)
                windingAnim++;
            
            if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
                hsp = xscale * movespeed;
            else if (place_meeting(x, y + 1, obj_railh))
                hsp = (xscale * movespeed) - 5;
            else if (place_meeting(x, y + 1, obj_railh2))
                hsp = (xscale * movespeed) + 5;
            
            mach2 = 100;
            momemtum = true;
            move = key_right + key_left;
            move2 = key_right2 + key_left2;
            
            if (fightball == true && global.coop == true)
            {
                if (object_index == obj_player1)
                {
                    x = obj_player2.x;
                    y = obj_player2.y;
                }
                
                if (object_index == obj_player2)
                {
                    x = obj_player1.x;
                    y = obj_player1.y;
                }
            }
            
            if (movespeed < 24 && grounded)
            {
                if (!instance_exists(crazyruneffectid) && grounded)
                {
                    with (instance_create(x, y, obj_crazyruneffect))
                    {
                        playerid = other.object_index;
                        other.crazyruneffectid = id;
                    }
                    
                    if (sprite_index == spr_crazyrun)
                    {
                        with (instance_create(x, y, obj_dashcloud))
                        {
                            image_xscale = other.xscale;
                            sprite_index = spr_flamecloud;
                        }
                    }
                }
            }
            
            crouchslideAnim = true;
            
            if (!key_jump2 && jumpstop == false && vsp < 0.5)
            {
                vsp /= 20;
                jumpstop = true;
            }
            
            if (grounded && vsp > 0)
                jumpstop = false;
            
            if (input_buffer_jump < 8 && grounded && !(move == 1 && xscale == -1) && !(move == -1 && xscale == 1))
            {
                scr_soundeffect(12);
                
                if (sprite_index != spr_fightball)
                {
                    image_index = 0;
                    sprite_index = spr_mach3jump;
                }
                
                vsp = -11;
            }
            
            if (fightball == false)
            {
                if (sprite_index == spr_mach3jump && floor(image_index) == (image_number - 1))
                    sprite_index = spr_mach4;
                
                if (floor(image_index) == (image_number - 1) && (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_dashpadmach))
                    sprite_index = spr_mach4;
                
                if (sprite_index == spr_mach2jump && grounded && vsp > 0)
                    sprite_index = spr_mach4;
                
                if (abs(hsp) > 20 && sprite_index != spr_crazyrun && sprite_index != spr_taunt && sprite_index != spr_player_Sjumpcancelstart)
                {
                    flash = true;
                    sprite_index = spr_crazyrun;
                }
                else if (abs(hsp) <= 20 && sprite_index == spr_crazyrun)
                {
                    sprite_index = spr_mach4;
                }
            }
            
            if (sprite_index == spr_crazyrun && !instance_exists(crazyruneffectid))
            {
                with (instance_create(x, y, obj_crazyrunothereffect))
                {
                    playerid = other.object_index;
                    other.crazyruneffectid = id;
                }
            }
            
            if (key_jump && !grounded)
            {
                image_index = 0;
                sprite_index = spr_player_Sjumpcancelstart;
            }
            
            if (grounded && (sprite_index == spr_player_Sjumpcancelstart || sprite_index == spr_taunt))
                sprite_index = spr_mach4;
            
            if (floor(image_index) == 0 && sprite_index == spr_player_Sjumpcancelstart)
            {
                scr_soundeffect(84);
                taunttimer = 20;
                tauntstoredsprite = sprite_index;
                image_index = random_range(0, 11);
                sprite_index = spr_taunt;
                
                with (instance_create(x, y, obj_taunteffect))
                    player = other.id;
            }
            
            if (sprite_index == spr_taunt)
                taunttimer--;
            else
                tauntimer = 0;
            
            if (taunttimer <= 0 && sprite_index == spr_taunt)
                tauntstoredsprite = sprite_index;
            
            if (sprite_index == spr_mach4 || sprite_index == spr_fightball)
                image_speed = 0.4;
            else if (sprite_index == spr_crazyrun)
                image_speed = 0.75;
            else if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit)
                image_speed = 0.4;
            
            if (key_jump)
                input_buffer_jump = 0;
            
            if (((!key_attack && fightball == false) && grounded) || ((character == "S" && (move == 0 || move != xscale) && grounded) && fightball == false))
            {
                sprite_index = spr_machslidestart;
                scr_soundeffect(89);
                state = UnknownEnum.Value_105;
                image_index = 0;
            }
            
            if (move == -xscale && grounded && fightball == false)
            {
                scr_soundeffect(86);
                sprite_index = spr_mach3boost;
                state = UnknownEnum.Value_105;
                image_index = 0;
            }
            
            if (key_down && fightball == false && !place_meeting(x, y, obj_dashpad))
            {
                particle_set_scale(UnknownEnum.Value_5, xscale, 1);
                create_particle(x, y, UnknownEnum.Value_5, 0);
                flash = false;
                state = UnknownEnum.Value_65;
                vsp = 10;
            }
            
            if ((!grounded && place_meeting(x + hsp, y, obj_solid) && (!place_meeting(x + sign(hsp), y, 311 || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x + hsp, y, obj_mach3solid))) || (grounded && (place_meeting(x + hsp, y - 32, obj_solid) || scr_solid_slope(x + sign(hsp), y - 32)) && place_meeting(x, y + 1, obj_slope) && !place_meeting(x + hsp, y, obj_mach3solid)))
            {
                wallspeed = 10;
                state = UnknownEnum.Value_37;
            }
            
            if ((scr_solid(x + 1, y) && !place_meeting(x + 1, y, obj_mach3solid) && xscale == 1) && !scr_slope() && (!place_meeting(x + sign(hsp), y, obj_slope) || place_meeting(x + sign(hsp), y, obj_solid)) && (grounded || fightball == true))
            {
                if (fightball == false)
                {
                    sprite_index = spr_hitwall;
                    scr_soundeffect(27);
                    scr_soundeffect(28);
                    
                    with (obj_camera)
                    {
                        shake_mag = 20;
                        shake_mag_acc = 40 / room_speed;
                    }
                    
                    hsp = 0;
                    image_speed = 0.35;
                    
                    with (obj_baddie)
                    {
                        if (point_in_camera(x, y, view_camera[0]) && shakestun && grounded && vsp > 0)
                        {
                            stun = true;
                            alarm[0] = 200;
                            ministun = false;
                            vsp = -5;
                            hsp = 0;
                        }
                    }
                    
                    flash = false;
                    state = UnknownEnum.Value_106;
                    hsp = -2.5;
                    vsp = -3;
                    mach2 = 0;
                    image_index = 0;
                    instance_create(x + 10, y + 10, obj_bumpeffect);
                }
                else if (fightball == true)
                {
                    with (obj_player)
                    {
                        sprite_index = spr_hitwall;
                        scr_soundeffect(27);
                        scr_soundeffect(28);
                        
                        with (obj_camera)
                        {
                            shake_mag = 20;
                            shake_mag_acc = 40 / room_speed;
                        }
                        
                        hsp = 0;
                        image_speed = 0.35;
                        
                        with (obj_baddie)
                        {
                            if (point_in_camera(x, y, view_camera[0]) && shakestun && grounded && vsp > 0)
                            {
                                stun = true;
                                alarm[0] = 200;
                                ministun = false;
                                vsp = -5;
                                hsp = 0;
                            }
                        }
                        
                        flash = false;
                        state = UnknownEnum.Value_106;
                        hsp = -2.5;
                        vsp = -3;
                        mach2 = 0;
                        image_index = 0;
                        instance_create(x + 10, y + 10, obj_bumpeffect);
                    }
                    
                    fightball = false;
                }
            }
            
            if ((scr_solid(x - 1, y) && !place_meeting(x - 1, y, obj_mach3solid) && xscale == -1) && !scr_slope() && (!place_meeting(x + sign(hsp), y, obj_slope) || place_meeting(x + sign(hsp), y, obj_solid)) && (grounded || fightball == true))
            {
                if (fightball == false)
                {
                    sprite_index = spr_hitwall;
                    scr_soundeffect(27);
                    scr_soundeffect(28);
                    
                    with (obj_camera)
                    {
                        shake_mag = 20;
                        shake_mag_acc = 40 / room_speed;
                    }
                    
                    hsp = 0;
                    image_speed = 0.35;
                    
                    with (obj_baddie)
                    {
                        if (point_in_camera(x, y, view_camera[0]) && shakestun && grounded && vsp > 0)
                        {
                            stun = true;
                            alarm[0] = 200;
                            ministun = false;
                            vsp = -5;
                            hsp = 0;
                        }
                    }
                    
                    flash = false;
                    state = UnknownEnum.Value_106;
                    hsp = 2.5;
                    vsp = -3;
                    mach2 = 0;
                    image_index = 0;
                    instance_create(x - 10, y + 10, obj_bumpeffect);
                }
                else if (fightball == true)
                {
                    with (obj_player)
                    {
                        sprite_index = spr_hitwall;
                        scr_soundeffect(27);
                        scr_soundeffect(28);
                        
                        with (obj_camera)
                        {
                            shake_mag = 20;
                            shake_mag_acc = 40 / room_speed;
                        }
                        
                        hsp = 0;
                        image_speed = 0.35;
                        
                        with (obj_baddie)
                        {
                            if (point_in_camera(x, y, view_camera[0]) && shakestun && grounded && vsp > 0)
                            {
                                stun = true;
                                alarm[0] = 200;
                                ministun = false;
                                vsp = -5;
                                hsp = 0;
                            }
                        }
                        
                        flash = false;
                        state = UnknownEnum.Value_106;
                        hsp = -2.5;
                        vsp = -3;
                        mach2 = 0;
                        image_index = 0;
                        instance_create(x + 10, y + 10, obj_bumpeffect);
                    }
                    
                    fightball = false;
                }
            }
            
            if (key_slap2 && character == "V")
            {
                vsp = -5;
                state = UnknownEnum.Value_1;
                image_index = 0;
                sprite_index = spr_playerV_airrevolver;
                image_index = 0;
                
                with (instance_create(x + (xscale * 20), y + 20, obj_shotgunbullet))
                {
                    is_solid = false;
                    image_xscale = other.xscale;
                }
                
                scr_soundeffect(26);
            }
            
            if (key_shoot2 && character == "V" && !instance_exists(dynamite_inst))
            {
                vsp = -5;
                state = UnknownEnum.Value_2;
                image_index = 0;
                sprite_index = spr_playerV_dynamitethrow;
                
                with (instance_create(x, y, obj_dynamite))
                {
                    image_xscale = other.xscale;
                    playerid = other.id;
                    other.dynamite_inst = id;
                    movespeed = other.movespeed + 4;
                    vsp = -6;
                }
            }
            
            break;
        
        case "N":
            hsp = xscale * movespeed;
            move = key_right + key_left;
            
            if (fightball == false)
                vsp = 0;
            
            if (key_up && fightball == false)
                vsp = -3;
            
            if (key_down && fightball == false)
                vsp = 3;
            
            if (abs(hsp) < 24 && move == xscale)
            {
                if (!instance_exists(crazyruneffectid) && grounded)
                {
                    with (instance_create(x, y, obj_crazyruneffect))
                    {
                        playerid = other.object_index;
                        other.crazyruneffectid = id;
                    }
                    
                    if (sprite_index == spr_crazyrun)
                    {
                        if (flamecloud_buffer > 0)
                        {
                            flamecloud_buffer--;
                        }
                        else
                        {
                            flamecloud_buffer = 220 + irandom_range(1, 180);
                            
                            with (instance_create(x, y, obj_dashcloud))
                            {
                                image_xscale = other.xscale;
                                sprite_index = spr_flamecloud;
                            }
                        }
                    }
                }
            }
            
            if (key_attack2 && character == "N" && fightball == false)
            {
                sprite_index = spr_playerN_pogostart;
                image_index = 0;
                state = UnknownEnum.Value_58;
                pogospeed = movespeed;
            }
            
            if (fightball == false)
            {
                if (abs(hsp) > 20 && sprite_index != spr_crazyrun)
                {
                    flash = true;
                    sprite_index = spr_crazyrun;
                }
                else if (movespeed <= 20 && sprite_index == spr_crazyrun)
                {
                    sprite_index = spr_playerN_jetpackboost;
                }
            }
            
            if (character == "N" && key_jump2 && fightball == false)
            {
                scr_soundeffect(12);
                scr_soundeffect(99);
                jumpstop = false;
                vsp = -15;
                state = UnknownEnum.Value_92;
                sprite_index = spr_playerN_noisebombspinjump;
                image_index = 0;
                particle_set_scale(UnknownEnum.Value_5, xscale, 1);
                create_particle(x, y, UnknownEnum.Value_5, 0);
            }
            
            if (key_down && fightball == false && !place_meeting(x, y, obj_dashpad) && grounded)
            {
                with (instance_create(x, y, obj_jumpdust))
                    image_xscale = other.xscale;
                
                flash = false;
                sprite_index = spr_playerN_jetpackslide;
                state = UnknownEnum.Value_65;
            }
            
            if (!key_jump2 && jumpstop == false && vsp < 0.5 && fightball == true)
            {
                vsp /= 20;
                jumpstop = true;
            }
            
            if (grounded && vsp > 0 && fightball == true)
                jumpstop = false;
            
            if (input_buffer_jump < 8 && grounded && !(move == 1 && xscale == -1) && !(move == -1 && xscale == 1) && fightball == true)
            {
                scr_soundeffect(12);
                
                if (sprite_index != spr_fightball)
                {
                    image_index = 0;
                    sprite_index = spr_mach3jump;
                }
                
                vsp = -11;
            }
            
            if ((scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_mach3solid)) && (!place_meeting(x + sign(hsp), y, obj_slope) || place_meeting(x + sign(hsp), y, obj_solid)) && (!place_meeting(x + sign(hsp), y, obj_metalblock) && character != "V") && (!place_meeting(x + sign(hsp), y, obj_destructibles) && character != "V") && !place_meeting(x + sign(hsp), y, obj_hungrypillar))
            {
                pizzapepper = 0;
                sprite_index = spr_hitwall;
                scr_soundeffect(27);
                scr_soundeffect(28);
                
                with (obj_camera)
                {
                    shake_mag = 20;
                    shake_mag_acc = 40 / room_speed;
                }
                
                hsp = 0;
                image_speed = 0.35;
                
                with (obj_baddie)
                {
                    if (point_in_camera(x, y, view_camera[0]) && shakestun && grounded && vsp > 0)
                    {
                        stun = true;
                        alarm[0] = 200;
                        ministun = false;
                        vsp = -5;
                        hsp = 0;
                    }
                }
                
                flash = false;
                state = UnknownEnum.Value_106;
                hsp = 2.5;
                vsp = -3;
                mach2 = 0;
                image_index = 0;
                instance_create(x - 10, y + 10, obj_bumpeffect);
            }
            
            break;
    }
    
    if (!instance_exists(dashcloudid) && grounded && !place_meeting(x, y + 1, obj_water))
    {
        with (instance_create(x, y, obj_superdashcloud))
        {
            if (other.fightball == true)
                instance_create(obj_player.x, obj_player.y, obj_slapstar);
            
            image_xscale = other.xscale;
            other.dashcloudid = id;
        }
    }
    
    if (!instance_exists(dashcloudid) && grounded && place_meeting(x, y + 1, obj_water))
    {
        with (instance_create(x, y, obj_superdashcloud))
        {
            if (other.fightball == true)
                instance_create(obj_player.x, obj_player.y, obj_slapstar);
            
            image_xscale = other.xscale;
            sprite_index = spr_watereffect;
            other.dashcloudid = id;
        }
    }
    
    scr_dotaunt();
    
    if (!instance_exists(chargeeffectid))
    {
        with (instance_create(x, y, obj_chargeeffect))
        {
            playerid = other.object_index;
            other.chargeeffectid = id;
        }
    }
    
    if (sprite_index == spr_mach4 || sprite_index == spr_fightball)
        image_speed = 0.4;
    else if (sprite_index == spr_crazyrun)
        image_speed = 0.75;
    else if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit)
        image_speed = 0.4;
    else
        image_speed = 0.4;
    
    if (key_up && fightball == false && character == "P" && grounded && sprite_index != spr_dashpadmach && !place_meeting(x, y, obj_dashpad))
    {
        sprite_index = spr_superjumpprep;
        state = UnknownEnum.Value_99;
        hsp = 0;
        image_index = 0;
    }
    
    if (global.attackstyle == 2 && key_slap2)
    {
        randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, 557, 556, 555, spr_punch]);
        image_index = 0;
        state = UnknownEnum.Value_43;
    }
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_5 = 5,
    Value_37 = 37,
    Value_42 = 42,
    Value_43,
    Value_58 = 58,
    Value_65 = 65,
    Value_92 = 92,
    Value_99 = 99,
    Value_105 = 105,
    Value_106
}
