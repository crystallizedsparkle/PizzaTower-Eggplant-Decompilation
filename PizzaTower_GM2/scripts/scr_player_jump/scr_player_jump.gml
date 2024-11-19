function state_player_jump()
{
    var _playerid;
    
    landAnim = true;
    
    if (!momemtum)
        hsp = move * movespeed;
    else
        hsp = xscale * movespeed;
    
    hsp += (railmovespeed * raildir);
    
    if (key_taunt2)
    {
        input_finisher_buffer = 60;
        input_attack_buffer = 0;
        input_up_buffer = 0;
        input_down_buffefr = 0;
    }
    
    if (dir != xscale)
    {
        dir = xscale;
        movespeed = 2;
        facehurt = false;
    }
    
    if (move != xscale)
        movespeed = 2;
    
    move = key_left + key_right;
    
    if (movespeed == 0)
        momemtum = false;
    
    if (scr_solid(x + hsp, y))
    {
        movespeed = 0;
        mach2 = 0;
    }
    
    if (move != 0)
    {
        xscale = move;
        
        if (movespeed < 8)
            movespeed += 0.5;
        else if (floor(movespeed) == 8)
            movespeed = 6;
        
        if (scr_solid(x + xscale, y) && move == xscale)
            movespeed = 0;
    }
    else
    {
        movespeed = 0;
    }
    
    if (movespeed > 8)
        movespeed -= 0.1;
    
    if (ladderbuffer > 0)
        ladderbuffer--;
    
    if (!jumpstop)
    {
        if (!key_jump2 && vsp < 0.5 && !stompAnim)
        {
            vsp /= 20;
            jumpstop = true;
        }
        else if (scr_solid(x, y - 1) && !jumpAnim)
        {
            vsp = grav;
            jumpstop = true;
        }
    }
    
    if (character == "N")
    {
        if (key_jump && wallclingcooldown == 10)
        {
            if (place_meeting(x + xscale, y, obj_solid))
            {
                scr_soundeffect(41);
                sprite_index = spr_playerN_wallclingstart;
                image_index = 0;
                state = states.hang;
                xscale *= -1;
                vsp = 0;
                doublejump = false;
            }
            else if (!doublejump && sprite_index != spr_freefall && sprite_index != spr_facestomp)
            {
                scr_soundeffect(99);
                sprite_index = spr_playerN_doublejump;
                image_index = 0;
                jumpstop = false;
                vsp = -9;
                doublejump = true;
                particle_set_scale(particles.highjumpcloud2, xscale, 1);
                create_particle(x, y, particles.highjumpcloud2, 0);
            }
        }
    }
    
    if (global.mort && (sprite_index == spr_mortdoublejump || sprite_index == spr_mortdoublejumpstart))
    {
        if (vsp > 6)
            vsp = 6;
        
        if (!key_jump2)
        {
            grav = 0.5;
            sprite_index = spr_fall;
        }
    }
    
    if (key_jump)
    {
        if (global.mort && sprite_index != spr_mortdoublejump)
        {
            repeat (6)
                create_debris(x, y, 1149);
            
            scr_soundeffect(99);
            sprite_index = spr_mortdoublejump;
            image_index = 0;
            jumpstop = false;
            grav = 0.25;
            mort = true;
        }
    }
    
    if (grounded)
    {
        if (input_buffer_jump < 8 && !key_down && !key_attack && vsp > 0 && !(sprite_index == spr_facestomp || sprite_index == spr_freefall))
        {
            scr_soundeffect(12);
            stompAnim = false;
            vsp = -11;
            state = states.jump;
            jumpAnim = true;
            jumpstop = false;
            freefallstart = 0;
            railmomentum = false;
            
            if (place_meeting(x, y + 1, obj_railparent))
                railmomentum = true;
            
            if (sprite_index != spr_shotgunshoot)
            {
                sprite_index = spr_jump;
                
                if (shotgunAnim)
                    sprite_index = spr_shotgunjump;
                
                image_index = 0;
            }
            
            particle_set_scale(particles.highjumpcloud2, xscale, 1);
            create_particle(x, y, particles.highjumpcloud2, 0);
        }
        
        if (vsp > 0 && (!key_attack || sprite_index == spr_suplexbump))
        {
            scr_soundeffect(41);
            
            if (key_attack || sprite_index == spr_shotgunshoot)
                landAnim = false;
            
            if (sprite_index == spr_mortdoublejump || sprite_index == spr_mortdoublejumpstart)
                sprite_index = spr_player_mortland;
            
            if (sprite_index != spr_shotgunshoot)
                image_index = 0;
            
            input_buffer_secondjump = 0;
            state = states.normal;
            jumpAnim = true;
            jumpstop = false;
            freefallstart = 0;
            create_particle(x, y, particles.landcloud, 0);
        }
    }
    
    if (key_jump)
        input_buffer_jump = 0;
    
    if (vsp > 5 && sprite_index != spr_mortdoublejump)
        fallinganimation++;
    
    if (fallinganimation >= 40 && fallinganimation < 80)
        sprite_index = spr_facestomp;
    else if (fallinganimation >= 80)
        sprite_index = spr_freefall;
    
    if (!stompAnim)
    {
        if (!jumpAnim)
        {
            switch (sprite_index)
            {
                case spr_mortdoublejumpstart:
                    sprite_index = spr_mortdoublejump;
                    break;
                
                case spr_playerN_doublejump:
                    sprite_index = spr_playerN_doublejumpfall;
                    break;
                
                case spr_airdash1:
                    sprite_index = spr_airdash2;
                    break;
                
                case spr_shotgunjump:
                    sprite_index = spr_shotgunfall;
                    break;
                
                case spr_playerV_superjump:
                    sprite_index = spr_playerV_fall;
                    break;
                
                case spr_jump:
                    sprite_index = spr_fall;
                    break;
                
                case spr_suplexcancel:
                    sprite_index = spr_fall;
                    break;
                
                case spr_player_backflip:
                    sprite_index = spr_fall;
                    break;
                
                case spr_player_Sjumpstart:
                    sprite_index = spr_player_Sjump;
                    break;
                
                case spr_player_shotgunjump1:
                    sprite_index = spr_player_shotgunjump2;
                    break;
                
                case spr_shotgun_shootair:
                    sprite_index = spr_shotgunfall;
                    break;
                
                case spr_shotgunshoot:
                    sprite_index = spr_shotgunfall;
                    break;
                
                case spr_stompprep:
                    sprite_index = spr_stomp;
                    break;
                
                case spr_player_groundpoundjump:
                    sprite_index = spr_fall;
                    break;
            }
        }
    }
    else if (sprite_index == spr_stompprep && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_stomp;
    }
    
    if (key_down2 && !global.kungfu)
    {
        input_buffer_slap = 8;
        
        if (!shotgunAnim)
        {
            sprite_index = spr_bodyslamstart;
            image_index = 0;
            state = states.freefall;
            vsp = -6;
        }
        else
        {
            scr_soundeffect(26);
            sprite_index = spr_shotgunjump1;
            image_index = 0;
            state = states.freefall;
            vsp = -11;
            
            with (instance_create(x + (xscale * 30), y + 60, obj_shotgunbullet))
            {
                image_xscale = other.xscale;
                sprite_index = sprite10391;
                spdh = -10;
                spd = 0;
                shotgun = true;
            }
            
            with (instance_create(x + (xscale * 30), y + 60, obj_shotgunbullet))
            {
                image_xscale = other.xscale;
                sprite_index = sprite10391;
                spdh = -10;
                spd = 5;
                shotgun = true;
            }
            
            with (instance_create(x + (xscale * 30), y + 60, obj_shotgunbullet))
            {
                image_xscale = other.xscale;
                sprite_index = sprite10391;
                spdh = -10;
                spd = -5;
                shotgun = true;
            }
        }
    }
    
    if (sprite_index == spr_player_suplexcancel)
        image_speed = 0.4;
    else
        image_speed = 0.35;
    
    if (grounded && (sprite_index == spr_facestomp || sprite_index == spr_freefall))
    {
        scr_soundeffect(27);
        image_index = 0;
        sprite_index = spr_bodyslamland;
        state = states.freefallland;
        
        with (obj_baddie)
        {
            if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
            {
                vsp = -7;
                hsp = 0;
            }
        }
        
        with (obj_camera)
        {
            shake_mag = 10;
            shake_mag_acc = 30 / room_speed;
        }
    }
    
    if (key_slap2 && sprite_index != spr_suplexbump)
    {
        image_index = 0;
        sprite_index = spr_suplexdashjumpstart;
        flash = true;
        suplexmove = true;
        suplexdashsnd = audio_play_sound(sfx_suplexdash, 1, 0);
        sfx_gain(suplexdashsnd);
        state = states.handstandjump;
        movespeed = 5;
    }
    
    if (key_shoot2 && shotgunAnim)
        scr_shotgunshoot();
    
    if (key_slap2 && shoot)
    {
        if (!shotgunAnim)
        {
            flash = true;
            
            if (!instance_exists(parry_inst) && flash == true)
            {
                parry_inst = instance_create(x, y, obj_parryhitbox);
                _playerid = 1;
                
                if (object_index == obj_player2)
                    _playerid = 2;
                
                with (parry_inst)
                {
                    player_id = _playerid;
                    image_xscale = other.xscale;
                }
            }
            
            if (global.mort)
            {
                with (instance_create(x + (xscale * 20), y, obj_shotgunbullet))
                {
                    image_xscale = other.xscale;
                    sprite_index = spr_mortprojectile;
                }
                
                sprite_index = spr_mortthrow;
                image_index = 0;
                state = states.pistol;
                mort = true;
                
                with (obj_camera)
                {
                    shake_mag = 3;
                    shake_mag_acc = 3 / room_speed;
                }
            }
            else if (character != "V" && shoot)
            {
                sprite_index = spr_pistolshot;
                image_index = 0;
                movespeed = 5;
                state = states.handstandjump;
                shoot = true;
                
                with (obj_camera)
                {
                    shake_mag = 3;
                    shake_mag = 3 / room_speed;
                }
                
                if (ispeppino)
                {
                    with (instance_create(x + (xscale * 20), y, obj_shotgunbullet))
                    {
                        pistol = true;
                        sprite_index = spr_peppinobullet;
                        image_xscale = other.xscale;
                    }
                }
                else
                {
                    with (instance_create(x, y, obj_playerbomb))
                    {
                        kick = true;
                        movespeed = 15;
                        image_xscale = other.xscale;
                    }
                }
            }
            else if (character != "V")
            {
            }
        }
    }
    
    switch (character)
    {
        case "P":
            if (key_attack && grounded && fallinganimation < 40)
            {
                sprite_index = spr_mach1;
                image_index = 0;
                state = states.mach2;
                
                if (movespeed < 6)
                    movespeed = 6;
            }
            
            break;
        
        case "V":
            if (key_attack && grounded && fallinganimation < 40)
            {
                jumpAnim = true;
                
                if (pizzapepper == 0)
                {
                    sprite_index = spr_mach1;
                    image_index = 0;
                    movespeed = 6;
                    state = states.mach1;
                }
                else
                {
                    sprite_index = spr_crazyrun;
                    movespeed = 20;
                    state = states.mach3;
                }
            }
            
            if (key_shoot2 && !instance_exists(dynamite_inst))
            {
                sprite_index = spr_playerV_dynamitethrow;
                image_index = 0;
                
                if (move == 0)
                    movespeed = 0;
                
                state = states.dynamite;
                
                with (instance_create(x, y, obj_dynamite))
                {
                    image_xscale = other.xscale;
                    other.dynamite_inst = id;
                    playerid = other.id;
                    movespeed = 6;
                    vsp = -6;
                }
            }
            
            if (sprite_index == spr_playerV_superjump && floor(image_index) == (image_number - 1))
                create_particle(x, y + 25, particles.shotgunimpact, 0);
            
            if (key_slap2)
            {
                sprite_index = spr_playerV_airrevolver;
                image_index = 0;
                vsp = -5;
                state = states.revolver;
                
                with (instance_create(x + (xscale * 20), y + 20, obj_shotgunbullet))
                {
                    is_solid = false;
                    image_xscale = other.xscale;
                }
                
                scr_soundeffect(26);
            }
            
            break;
        
        case "N":
            if (key_attack2 && (pogochargeactive || pizzapepper > 0))
            {
                scr_soundeffect(33);
                
                if (!key_up)
                    sprite_index = spr_playerN_jetpackstart;
                else
                    sprite_index = spr_superjumpprep;
                
                image_index = 0;
                hsp = 0;
                vsp = 0;
                state = states.Sjumpprep;
            }
            
            if (key_attack && !pogochargeactive && !key_slap2 && pizzapepper == 0)
            {
                sprite_index = spr_playerN_pogostart;
                image_index = 0;
                state = states.pogo;
            }
            
            break;
    }
    
    if (!key_attack || move != xscale)
        mach2 = 0;
    
    if (floor(image_index) == (image_number - 1))
        jumpAnim = false;
    
    scr_dotaunt();
    
    if (sprite_index == spr_shotgunshoot)
    {
        landAnim = false;
        machslideAnim = false;
        image_speed = 0.45;
        
        if (image_index > (image_number - 1))
            sprite_index = spr_shotgunfall;
    }
    
    if (place_meeting(x, y, obj_solid))
    {
        state = states.crouch;
        landAnim = false;
        crouchAnim = true;
        image_index = 0;
        idle = 0;
    }
}

function state_pepperman_jump()
{
    pepperman_grab_reset();
    move = key_left + key_right;
    
    if (move != 0 && move == sign(xscale) && movespeed < pepperman_maxhsp_normal)
        movespeed += pepperman_accel_air;
    else if (move != 0 && move != sign(xscale) && movespeed > 0)
        movespeed -= pepperman_deccel_air;
    else if (move == 0)
        movespeed -= pepperman_deccel_air;
    
    if (floor(movespeed) == pepperman_maxhsp_normal)
        movespeed = pepperman_maxhsp_normal;
    
    if (movespeed > pepperman_maxhsp_normal)
        movespeed -= 0.3;
    else if (movespeed < 0)
        movespeed = 0;
    
    if (move != 0 && movespeed == 0)
        xscale = move;
    
    hsp = xscale * movespeed;
    
    if (sprite_index == spr_jump && floor(image_index) == (image_number - 1))
        sprite_index = spr_fall;
    
    if (!key_jump2 && jumpstop == false && vsp < 0.5)
    {
        vsp /= 20;
        jumpstop = true;
    }
    
    if (grounded && vsp > 0)
    {
        state = states.normal;
        instance_create(x, y - 5, obj_landcloud);
    }
    
    if (key_down2 && !grounded)
    {
        state = states.freefall;
        freefallsmash = 12;
        vsp = 14;
        sprite_index = spr_bodyslamfall;
    }
    
    if (key_attack && (!place_meeting(x + xscale, y, obj_solid) || place_meeting(x + xscale, y, obj_destructibles)) && pepperman_grabID == -4 && sprite_index != spr_pepperman_throw)
    {
        if (move != 0)
            xscale = move;
        
        state = states.shoulderbash;
        sprite_index = spr_pepperman_shoulderstart;
        image_index = 0;
        scr_soundeffect(45);
    }
    
    if (sprite_index == spr_pepperman_throw && floor(image_index) == (image_number - 1))
        sprite_index = spr_pepperman_fall;
    
    if (key_jump)
        input_buffer_jump = 0;
    
    if (ladderbuffer > 0)
        ladderbuffer--;
    
    if (key_taunt2)
    {
        scr_soundeffect(84);
        taunttimer = 20;
        tauntstoredmovespeed = movespeed;
        tauntstoredvsp = vsp;
        tauntstoredsprite = sprite_index;
        tauntstoredstate = state;
        state = states.backbreaker;
        
        if (supercharged == true)
        {
            image_index = 0;
            sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3, spr_supertaunt4);
        }
        else
        {
            taunttimer = 20;
            image_index = random_range(0, 11);
            sprite_index = spr_taunt;
        }
        
        with (instance_create(x, y, obj_taunteffect))
            player = other.id;
    }
}

function scr_player_jump()
{
    if (character != "M")
        state_player_jump();
    else
        state_pepperman_jump();
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_4 = 4,
    Value_7 = 7,
    Value_12 = 12,
    Value_42 = 42,
    Value_58 = 58,
    Value_72 = 72,
    Value_84 = 84,
    Value_92 = 92,
    Value_99 = 99,
    Value_100,
    Value_103 = 103,
    Value_104,
    Value_108 = 108,
    Value_109,
    Value_111 = 111,
    Value_121 = 121,
    Value_153 = 153
}
