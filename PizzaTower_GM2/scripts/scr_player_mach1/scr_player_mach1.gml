function scr_player_mach1()
{
    var _railinst;
    
    image_speed = 0.5;
    landAnim = false;
    machhitAnim = false;
    crouchslideAnim = true;
    dir = xscale;
    move = key_left + key_right;
    
    if (scr_solid(x + xscale, y) && (!place_meeting(x + xscale, y, obj_slope) || scr_solid_slope(x + sign(hsp), y)))
    {
        mach2 = 0;
        state = UnknownEnum.Value_0;
        movespeed = 0;
    }
    
    if (!place_meeting(x, y + 1, obj_railparent))
    {
        hsp = xscale * movespeed;
    }
    else
    {
        _railinst = instance_place(x, y + 1, obj_railparent);
        hsp = (xscale * movespeed) + (_railinst.movespeed * _railinst.dir);
    }
    
    if (xscale != move && move != 0)
    {
        sprite_index = spr_mach1;
        image_index = 0;
        momemtum = false;
        mach2 = 0;
        movespeed = 6;
        xscale = move;
    }
    
    if (grounded)
    {
        if (movespeed <= 8)
            movespeed += 0.075;
        
        if (movespeed >= 8)
        {
            state = UnknownEnum.Value_104;
            particle_set_scale(UnknownEnum.Value_5, xscale, 1);
            create_particle(x, y, UnknownEnum.Value_5, 0);
        }
        
        if (vsp > 0)
            jumpstop = false;
        
        if (!instance_exists(dashcloudid))
        {
            with (instance_create(x, y, obj_dashcloud))
            {
                image_xscale = other.xscale;
                other.dashcloudid = id;
            }
        }
        
        if (sprite_index != spr_mach1 && vsp > 0)
        {
            sprite_index = spr_mach1;
            image_index = 0;
        }
        
        if (key_jump)
        {
            scr_soundeffect(12);
            sprite_index = spr_airdash1;
            image_index = 0;
            dir = xscale;
            momemtum = true;
            vsp = -11;
            jumpAnim = true;
        }
    }
    else if (sprite_index != spr_airdash1)
    {
        sprite_index = spr_airdash2;
    }
    
    if (sprite_index == spr_airdash1 && floor(image_index) == (image_number - 1))
        sprite_index = spr_airdash2;
    
    if (!key_attack)
    {
        state = UnknownEnum.Value_0;
        image_index = 0;
    }
    
    if (!key_jump2 && !jumpstop && vsp < 0.5)
    {
        vsp /= 20;
        jumpstop = true;
    }
    
    if (place_meeting(x + xscale, y, obj_solid) && !place_meeting(x + sign(hsp), y, obj_slope))
    {
        movespeed = 0;
        state = UnknownEnum.Value_0;
    }
    
    switch (character)
    {
        case "V":
            if (key_slap2)
            {
                scr_soundeffect(26);
                sprite_index = spr_playerV_airrevolver;
                image_index = 0;
                vsp = -5;
                state = UnknownEnum.Value_1;
                
                with (instance_create(x + (xscale * 20), y + 20, obj_shotgunbullet))
                {
                    is_solid = false;
                    image_xscale = other.xscale;
                }
            }
            
            if (key_shoot2 && !instance_exists(dynamite_inst))
            {
                image_index = 0;
                sprite_index = spr_playerV_dynamitethrow;
                vsp = -5;
                state = UnknownEnum.Value_2;
                
                with (instance_create(x, y, obj_dynamite))
                {
                    image_xscale = other.xscale;
                    movespeed = other.movespeed + 4;
                    vsp = -6;
                    other.dynamite_inst = id;
                    playerid = other.id;
                }
            }
            
            break;
    }
    
    if (key_down && !grounded)
    {
        if (!shotgunAnim)
        {
            sprite_index = spr_bodyslamstart;
            image_index = 0;
            state = UnknownEnum.Value_122;
            vsp = -5;
        }
        else
        {
            sprite_index = spr_player_shotgunjump1;
            image_index = 0;
            state = UnknownEnum.Value_122;
            vsp = -5;
            
            with (instance_create(x + (xscale * 30), y + 60, obj_shotgunbullet))
            {
                sprite_index = sprite10391;
                spdh = -10;
                spd = 0;
            }
            
            with (instance_create(x + (xscale * 30), y + 60, obj_shotgunbullet))
            {
                sprite_index = sprite10391;
                spdh = -10;
                spd = 5;
            }
            
            with (instance_create(x + (xscale * 30), y + 60, obj_shotgunbullet))
            {
                sprite_index = sprite10391;
                spdh = -10;
                spd = -5;
            }
        }
    }
    
    scr_dotaunt();
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_5 = 5,
    Value_104 = 104,
    Value_122 = 122
}