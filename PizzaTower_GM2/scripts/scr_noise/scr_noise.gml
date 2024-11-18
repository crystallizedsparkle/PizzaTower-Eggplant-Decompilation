function scr_noise_walk()
{
    var t, b, q;
    
    hsp = 0;
    
    if (sprite_index != spr_playerN_land)
        sprite_index = spr_playerN_idle;
    else if (floor(image_index) == (image_number - 1))
        sprite_index = spr_playerN_idle;
    
    if (scr_solid(x + image_xscale, y) || place_meeting(x + hsp, y, obj_hallway))
    {
        if (!place_meeting(x + sign(hsp), y, obj_slope))
            image_xscale *= -1;
    }
    
    if (grounded && vsp > 0 && (!scr_solid(x + (image_xscale * 15), y + 31) && !place_meeting(x + (image_xscale * 15), y + 31, obj_platform)))
        image_xscale *= -1;
    
    if (jumpbuffer > 0)
    {
        jumpbuffer--;
    }
    else if (!placedtraps)
    {
        placedtraps = true;
        jumpbuffer = jumpmax - (wastedhits * 10);
        jumpcount = wastedhits + 1;
        
        if (jumpcount > instance_number(obj_noise_pogospot))
            jumpcount = instance_number(obj_noise_pogospot);
        
        scr_noise_do_jump();
    }
    else if (attackpool != -4)
    {
        if (attackbuffer > 0)
        {
            attackbuffer--;
        }
        else
        {
            attackbuffer = 80 - (wastedhits * 10);
            t = false;
            
            with (obj_brickcomeback)
            {
                if (trapped)
                    t = true;
            }
            
            if (!t)
            {
                state = attackpool[irandom(array_length(attackpool) - 1)];
                attack = state;
                
                switch (state)
                {
                    case UnknownEnum.Value_130:
                        if (!instance_exists(obj_noisetrap_crosshair) && instance_exists(obj_noisetrap))
                        {
                            b = -4;
                            q = false;
                            
                            with (obj_noisetrap)
                            {
                                if (launch)
                                    q = true;
                            }
                            
                            if (!q)
                            {
                                with (obj_player1)
                                    b = instance_nearest(x, y, obj_noisetrap);
                                
                                with (instance_create(b.x, b.y, obj_noisetrap_crosshair))
                                    trapID = b;
                            }
                        }
                        
                        state = UnknownEnum.Value_134;
                        break;
                    
                    case UnknownEnum.Value_174:
                        substate = UnknownEnum.Value_174;
                        shield_buffer = 120;
                        break;
                    
                    case UnknownEnum.Value_72:
                        substate = UnknownEnum.Value_66;
                        sprite_index = spr_playerN_minigunstart;
                        image_index = 0;
                        break;
                }
            }
        }
    }
}

function scr_noise_punch()
{
    if (floor(image_index) == (image_number - 1))
        state = UnknownEnum.Value_134;
    
    hsp = 0;
    
    if (afterimage_buffer > 0)
    {
        afterimage_buffer--;
    }
    else
    {
        afterimage_buffer = 5;
        create_afterimage(x, y, sprite_index, image_number - 1);
    }
}

function scr_noise_do_jump(argument0 = true)
{
    var found, nearest, b, d;
    
    found = false;
    nearest = room_width * room_height;
    b = -4;
    
    with (obj_noise_pogospot)
    {
        if (!instance_exists(trapID) && other.oldtargetspot != id && other.targetspot != id)
        {
            d = distance_to_object(other);
            
            if (d < nearest)
            {
                nearest = d;
                b = id;
                found = true;
            }
        }
    }
    
    if (!found)
    {
        do
            targetspot = instance_nearest_random(163, 2);
        until (targetspot != oldtargetspot && targetspot != undefined);
    }
    else
    {
        targetspot = b;
    }
    
    oldtargetspot = targetspot;
    jump_speed = floor(distance_to_object(targetspot) * 0.04);
    
    if (jump_speed < 25)
        jump_speed = 25;
    
    jump_speed += floor(wastedhits / 2);
    calculate_jump_velocity_alt(targetspot.x + 16, targetspot.y + 16, jump_speed, grav);
    
    if (hsp != 0)
        image_xscale = sign(hsp);
    
    if (argument0)
    {
        state = UnknownEnum.Value_92;
        sprite_index = spr_playerN_jump;
        image_index = 0;
    }
}

function scr_noise_jump()
{
    if (sprite_index == spr_playerN_jump && floor(image_index) == (image_number - 1))
        sprite_index = spr_playerN_fall;
    
    y = clamp(y, -50, room_height + 100);
    x = clamp(x, 32, room_width - 32);
    
    if (vsp > 0 && y > 100 && (scr_solid(x, y + (vsp * 1.5)) || place_meeting(x, y + (vsp * 1.5), obj_slope)) && !scr_solid(x, y))
    {
        if (jumpcount > 0)
        {
            with (targetspot)
            {
                if (!instance_exists(trapID))
                    trapID = instance_create(x + 16, y, obj_noisetrap);
            }
            
            scr_noise_do_jump();
            jumpcount--;
        }
        else
        {
            state = UnknownEnum.Value_134;
            sprite_index = spr_playerN_land;
            image_index = 0;
        }
    }
}

function scr_noise_shield()
{
    switch (substate)
    {
        case UnknownEnum.Value_174:
            hsp = 0;
            
            if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerN_land)
                sprite_index = spr_playerN_idle;
            
            if (shield_buffer > 0)
            {
                shield_buffer--;
            }
            else
            {
                substate = UnknownEnum.Value_92;
                storedsubstate = UnknownEnum.Value_126;
                shield_buffer = 100;
                sprite_index = spr_playerN_jump;
                image_index = 0;
                scr_noise_do_jump(false);
            }
            
            break;
        
        case UnknownEnum.Value_92:
            if (sprite_index == spr_playerN_jump && floor(image_index) == (image_number - 1))
                sprite_index = spr_playerN_fall;
            
            y = clamp(y, -50, room_height + 100);
            x = clamp(x, 32, room_width - 32);
            
            if (vsp > 0 && y > 100 && (scr_solid(x, y + (vsp * 1.5)) || place_meeting(x, y + (vsp * 1.5), obj_slope)) && !scr_solid(x, y))
            {
                substate = storedsubstate;
                sprite_index = spr_playerN_land;
                image_index = 0;
            }
            
            break;
        
        case UnknownEnum.Value_126:
            hsp = 0;
            
            if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerN_land)
                sprite_index = spr_playerN_idle;
            
            if (shield_buffer > 0)
            {
                shield_buffer--;
            }
            else
            {
                substate = UnknownEnum.Value_92;
                storedsubstate = UnknownEnum.Value_174;
                shield_buffer = 120;
                sprite_index = spr_playerN_jump;
                image_index = 0;
                scr_noise_do_jump(false);
            }
            
            break;
    }
}

function scr_noise_pistol()
{
    var b;
    
    switch (substate)
    {
        case UnknownEnum.Value_66:
            if (floor(image_index) == (image_number - 1))
            {
                sprite_index = spr_playerN_minigunidle;
                substate = UnknownEnum.Value_126;
                cooldown = 1;
            }
            
            break;
        
        case UnknownEnum.Value_126:
            sprite_index = spr_playerN_minigunidle;
            b = -4;
            
            with (obj_player)
            {
                if (check_player_coop() && y > (other.y - 100) && y < (other.y + 30) && x > (other.x - 500) && x < (other.x + 500))
                    b = id;
            }
            
            if (cooldown > 0)
                cooldown--;
            
            if (b != -4 && cooldown <= 0)
            {
                cooldown = 80;
                shoot_buffer = 1;
                shoot_count = 30;
                substate = UnknownEnum.Value_69;
                
                if (x != b.x)
                    image_xscale = sign(b.x - x);
                
                sprite_index = spr_playerN_minigunshoot;
            }
            
            break;
        
        case UnknownEnum.Value_69:
            if (shoot_buffer > 0)
            {
                shoot_buffer--;
            }
            else
            {
                shoot_buffer = 6;
                shoot_count--;
                scr_soundeffect(26);
                
                with (instance_create(x + (image_xscale * 32), y + 10, obj_enemybullet))
                {
                    image_xscale = other.image_xscale;
                    vsp = irandom_range(-1, 1);
                    noiseboss = true;
                }
            }
            
            if (shoot_count <= 0)
                substate = UnknownEnum.Value_126;
            
            break;
    }
}

enum UnknownEnum
{
    Value_66 = 66,
    Value_69 = 69,
    Value_72 = 72,
    Value_92 = 92,
    Value_126 = 126,
    Value_130 = 130,
    Value_134 = 134,
    Value_174 = 174
}
