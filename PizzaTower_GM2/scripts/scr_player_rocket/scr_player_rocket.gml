function scr_player_rocket()
{
    var _spd, _accel;
    
    hsp = xscale * movespeed;
    move = key_right + key_left;
    
    with (instance_place(x + hsp, y, obj_asteroid))
        instance_destroy();
    
    alarm[5] = -1;
    alarm[8] = 60;
    alarm[7] = 120;
    hurted = true;
    
    if (sprite_index != spr_rocketstart)
    {
        _spd = 6;
        _accel = 1;
        
        if (key_up && !key_down)
            rocketvsp = Approach(rocketvsp, -_spd, _accel);
        else if (key_down && !key_up)
            rocketvsp = Approach(rocketvsp, _spd, _accel);
        else
            rocketvsp = Approach(rocketvsp, 0, _accel);
        
        vsp = rocketvsp;
        
        if (movespeed < 16)
            movespeed = 16;
    }
    else
    {
        rocketvsp = 0;
        vsp = 0;
        
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = spr_rocket;
            image_index = 0;
            movespeed = 16;
        }
    }
    
    if (key_jump)
    {
        dir = xscale;
        state = UnknownEnum.Value_104;
        sprite_index = spr_mach2jump;
        jumpstop = false;
        vsp = -11;
        instance_create(x, y, obj_jumpdust);
        
        with (instance_create(x, y + 12, obj_rocketdead))
        {
            hsp = other.xscale * 6;
            vsp = 5;
            image_xscale = sign(hsp);
        }
    }
    
    if (fightball == false)
    {
        if (sprite_index != spr_rocketstart)
        {
            sprite_index = spr_rocket;
            
            if (grounded && vsp >= 0)
                sprite_index = spr_player_rocketrun;
        }
    }
    
    if (grounded)
    {
        move = key_left + key_right;
        
        if (move != 0 && move != xscale && sprite_index != spr_rocketstart)
        {
            state = UnknownEnum.Value_185;
            scr_soundeffect(86);
            sprite_index = spr_player_rocketslide;
            image_index = 0;
        }
    }
    
    if (scr_solid(x + sign(hsp), y) && (!place_meeting(x + sign(hsp), y, obj_slope) || place_meeting(x + sign(hsp), y, obj_solid)) && (!place_meeting(x + sign(hsp), y, obj_metalblock) && (!place_meeting(x + sign(hsp), y, obj_ratblock) || place_meeting(x + sign(hsp), y, obj_rattumble)) && character != "V") && (!place_meeting(x + sign(hsp), y, obj_destructibles) && character != "V") && !place_meeting(x + sign(hsp), y, obj_hungrypillar))
    {
        pizzapepper = 0;
        sprite_index = spr_rockethitwall;
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
        hsp = -3.5 * xscale;
        vsp = -6;
        mach2 = 0;
        image_index = 0;
        instance_create(x - 10, y + 10, obj_bumpeffect);
        instance_create(x, y, obj_playerexplosion);
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
    
    if (sprite_index != spr_rocketstart && !instance_exists(chargeeffectid))
    {
        with (instance_create(x, y, obj_chargeeffect))
        {
            playerid = other.object_index;
            other.chargeeffectid = id;
        }
    }
    
    if (sprite_index == spr_mach4 || sprite_index == spr_fightball)
        image_speed = 0.4;
    
    if (sprite_index == spr_crazyrun)
        image_speed = 0.75;
    
    if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit)
        image_speed = 0.4;
    else
        image_speed = 0.4;
}

enum UnknownEnum
{
    Value_104 = 104,
    Value_106 = 106,
    Value_185 = 185
}