function scr_player_shotgunjump()
{
    image_speed = 0.35;
    move = key_left + key_right;
    hsp = move * movespeed;
    
    if (ladderbuffer > 0)
        ladderbuffer--;
    
    if (key_jump)
        input_buffer_jump = 0;
    
    if (dir != xscale)
    {
        dir = xscale;
        movespeed = 0;
    }
    
    if (move != 0)
    {
        xscale = move;
        
        if (movespeed < 8)
            movespeed += 0.5;
        else if (floor(movespeed) == 8)
            movespeed = 6;
    }
    else
    {
        movespeed = 0;
    }
    
    if (!key_jump2 && vsp < 0.5 && !jumpstop)
    {
        vsp /= 20;
        jumpstop = true;
    }
    
    if (scr_solid(x, y - 1) && !jumpstop)
    {
        vsp = grav;
        jumpstop = true;
    }
    
    if (input_buffer_jump < 8 && grounded)
    {
        input_buffer_jump = 8;
        state = UnknownEnum.Value_57;
        vsp = -11;
        jumpstop = false;
        sprite_index = spr_shotgunjump;
        image_index = 0;
    }
    
    if (grounded && vsp > 0)
    {
        sprite_index = spr_shotgunland;
        image_index = 0;
        landAnim = true;
        state = UnknownEnum.Value_66;
    }
    
    if (key_attack2)
    {
        state = UnknownEnum.Value_70;
        sprite_index = spr_shotgunsuplexdash;
        image_index = 0;
        movespeed = 10;
    }
    
    if (key_slap2)
    {
        scr_soundeffect(26);
        
        if (!key_down)
        {
            sprite_index = spr_shotgunshoot;
            image_index = 0;
            state = UnknownEnum.Value_69;
            
            with (instance_create(x, y, obj_pistoleffect))
                image_xscale = other.xscale;
            
            with (instance_create(x + (xscale * 20), y + 20, obj_shotgunbullet))
            {
                image_xscale = other.xscale;
                shotgun = true;
            }
            
            with (instance_create(x + (xscale * 20), y + 20, obj_shotgunbullet))
            {
                image_xscale = other.xscale;
                spdh = 4;
                shotgun = true;
            }
            
            with (instance_create(x + (xscale * 20), y + 20, obj_shotgunbullet))
            {
                image_xscale = other.xscale;
                spdh = -4;
                shotgun = true;
            }
        }
        else
        {
            state = UnknownEnum.Value_71;
            sprite_index = spr_shotgunjump1;
            image_index = 0;
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
    
    if (sprite_index == spr_shotgunjump && floor(image_index) == (image_number - 1))
        sprite_index = spr_shotgunfall;
}

enum UnknownEnum
{
    Value_57 = 57,
    Value_66 = 66,
    Value_69 = 69,
    Value_70,
    Value_71
}
