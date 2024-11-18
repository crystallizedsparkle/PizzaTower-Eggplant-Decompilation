function scr_player_mach2()
{
    var _railinst, mortjump, _bump;
    
    if (windingAnim < 2000)
        windingAnim++;
    
    if (place_meeting(x, y + 1, obj_railparent))
    {
        _railinst = instance_place(x, y + 1, obj_railparent);
        railmovespeed = _railinst.movespeed;
        raildir = _railinst.dir;
    }
    
    hsp = (xscale * movespeed) + (railmovespeed * raildir);
    move2 = key_right2 + key_left2;
    move = key_right + key_left;
    crouchslideAnim = true;
    
    if (!key_jump2 && jumpstop == false && vsp < 0.5)
    {
        vsp /= 20;
        jumpstop = true;
    }
    
    if (grounded && vsp > 0)
        jumpstop = false;
    
    if (input_buffer_jump < 8 && grounded && sprite_index != spr_secondjump1 && sprite_index != spr_clownjump && !(move == 1 && xscale == -1) && !(move == -1 && xscale == 1))
    {
        image_index = 0;
        sprite_index = spr_secondjump1;
        scr_soundeffect(12);
        
        if (skateboarding)
            sprite_index = spr_clownjump;
        
        vsp = -11;
    }
    
    mortjump = false;
    
    if (key_jump && global.mort == true && sprite_index != spr_mortdoublejump && !grounded && !skateboarding)
    {
        state = UnknownEnum.Value_92;
        
        repeat (6)
            create_debris(x, y, 1149);
        
        scr_soundeffect(99);
        sprite_index = spr_mortdoublejump;
        image_index = 0;
        grav = 0.25;
        
        with (instance_create(x, y, obj_highjumpcloud2))
            image_xscale = other.xscale;
        
        mort = true;
        mortjump = true;
    }
    
    if (grounded && vsp > 0)
    {
        if (machpunchAnim == false && sprite_index != spr_mach && sprite_index != spr_mach1 && sprite_index != spr_mach4 && sprite_index != spr_player_machhit)
        {
            if (sprite_index != spr_player_machhit && sprite_index != spr_rollgetup && sprite_index != spr_suplexdash && sprite_index != spr_taunt && sprite_index != spr_player_Sjumpcancelstart)
                sprite_index = spr_mach;
        }
        
        if (machpunchAnim == true)
        {
            if (punch == false)
                sprite_index = spr_machpunch1;
            
            if (punch == true)
                sprite_index = spr_machpunch2;
            
            if (floor(image_index) == 4 && sprite_index == spr_machpunch1)
            {
                punch = true;
                machpunchAnim = false;
            }
            
            if (floor(image_index) == 4 && sprite_index == spr_machpunch2)
            {
                punch = false;
                machpunchAnim = false;
            }
        }
    }
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_mach1)
        sprite_index = spr_mach;
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_longjump)
        sprite_index = spr_player_longjumpend;
    
    if (!grounded)
        machpunchAnim = false;
    
    if (grounded)
    {
        if ((scr_slope() && hsp != 0) && movespeed > 8)
            scr_player_addslopemomentum(0.1, 0.2);
        
        if (movespeed < 12)
        {
            if (mach4mode == false)
                movespeed += 0.1;
            else
                movespeed += 0.2;
        }
        
        if (abs(hsp) >= 12 && skateboarding == false && sprite_index != spr_suplexdash)
        {
            machhitAnim = false;
            state = UnknownEnum.Value_121;
            flash = true;
            
            if (sprite_index != spr_rollgetup)
                sprite_index = spr_mach4;
            
            particle_set_scale(UnknownEnum.Value_5, xscale, 1);
            create_particle(x, y, UnknownEnum.Value_5, 0);
        }
    }
    
    if (key_jump)
        input_buffer_jump = 0;
    
    if ((!grounded && (place_meeting(x + hsp, y, obj_solid) || scr_solid_slope(x + hsp, y)) && !place_meeting(x + hsp, y, obj_destructibles)) || (grounded && (place_meeting(x + sign(hsp), y - 16, obj_solid) || scr_solid_slope(x + sign(hsp), y - 16)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_metalblock) && place_meeting(x, y + 1, obj_slope)))
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
    
    if (!instance_exists(dashcloudid) && grounded)
    {
        with (instance_create(x, y, obj_dashcloud))
        {
            image_xscale = other.xscale;
            other.dashcloudid = id;
        }
    }
    
    if (grounded && floor(image_index) == (image_number - 1) && (sprite_index == spr_rollgetup || sprite_index == spr_player_rampjump))
        sprite_index = spr_mach;
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_suplexdash)
        sprite_index = spr_mach;
    
    if (!grounded && sprite_index != spr_secondjump2 && sprite_index != spr_clownjump && sprite_index != spr_clownfall && sprite_index != spr_mach2jump && sprite_index != spr_mach2jump && sprite_index != spr_walljumpstart && sprite_index != spr_taunt && sprite_index != spr_player_Sjumpcancelstart && sprite_index != spr_walljumpend && sprite_index != spr_player_longjump && sprite_index != spr_player_longjumpend)
    {
        sprite_index = spr_secondjump1;
        
        if (skateboarding)
            sprite_index = spr_clownfall;
    }
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_secondjump1)
        sprite_index = spr_secondjump2;
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_walljumpstart)
        sprite_index = spr_walljumpend;
    
    if (!grounded && sprite_index != spr_clownfall && sprite_index == spr_clownjump && floor(image_index) == (image_number - 1))
        sprite_index = spr_clownfall;
    
    if (key_down && !place_meeting(x, y, obj_dashpad))
    {
        particle_set_scale(UnknownEnum.Value_5, xscale, 1);
        create_particle(x, y, UnknownEnum.Value_5, 0);
        flash = false;
        state = UnknownEnum.Value_5;
        vsp = 10;
        image_index = 0;
        
        if (!grounded)
            sprite_index = spr_player_mach2jump;
        else
            sprite_index = spr_player_machroll;
        
        if (character == "V")
            sprite_index = spr_playerV_divekickstart;
    }
    
    if (key_attack && !place_meeting(x + xscale, y, obj_solid) && character == "S" && grounded)
    {
        state = UnknownEnum.Value_42;
        movespeed = 0;
    }
    
    if (scr_solid(x + xscale, y) && !scr_slope() && (scr_solid_slope(x + sign(hsp), y) || place_meeting(x + sign(hsp), y, obj_solid)) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_climbablewall) && grounded)
    {
        if (skateboarding)
        {
            xscale *= -1;
        }
        else
        {
            _bump = ledge_bump((vsp >= 0) ? 32 : 22);
            
            if (_bump)
            {
                state = UnknownEnum.Value_106;
                image_index = 0;
                sprite_index = spr_player_wallsplat;
            }
        }
    }
    
    if ((!key_attack && movespeed >= 8 && grounded && skateboarding == false) || (character == "S" && move == 0 && grounded))
    {
        image_index = 0;
        state = UnknownEnum.Value_105;
        scr_soundeffect(89);
        sprite_index = spr_machslidestart;
    }
    else if (!key_attack && movespeed < 8 && grounded && skateboarding == false)
    {
        state = UnknownEnum.Value_0;
    }
    
    if (move == -xscale && movespeed >= 8 && grounded && skateboarding == false)
    {
        scr_soundeffect(86);
        image_index = 0;
        state = UnknownEnum.Value_105;
        sprite_index = spr_machslideboost;
    }
    else if (move == -xscale && movespeed < 8 && grounded && skateboarding == false)
    {
        xscale *= -1;
        movespeed = 6;
    }
    
    if (clowntimer > 0 && skateboarding == true)
        clowntimer--;
    
    if (clowntimer <= 0 && skateboarding == true)
    {
        state = UnknownEnum.Value_0;
        instance_create(x, y, obj_genericpoofeffect);
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
            other.dynamite_inst = id;
            playerid = other.id;
            movespeed = other.movespeed + 4;
            vsp = -6;
        }
    }
    
    if (sprite_index == spr_rollgetup || sprite_index == spr_suplexdash)
        image_speed = 0.4;
    else
        image_speed = abs(movespeed) / 15;
    
    scr_dotaunt();
    
    if (skateboarding && sprite_index != spr_clownjump && grounded)
        sprite_index = spr_clown;
    
    if (mortjump)
        sprite_index = spr_player_mortjumpstart;
    
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
    
    if (global.attackstyle == 2 && key_slap2)
    {
        randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, 557, 556, 555, spr_punch]);
        image_index = 0;
        state = UnknownEnum.Value_43;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_5 = 5,
    Value_37 = 37,
    Value_42 = 42,
    Value_43,
    Value_92 = 92,
    Value_105 = 105,
    Value_106,
    Value_121 = 121
}