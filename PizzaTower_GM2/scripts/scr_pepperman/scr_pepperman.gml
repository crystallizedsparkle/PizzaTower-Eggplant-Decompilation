function scr_pepperman_walk()
{
    var b;
    
    hsp = 0;
    sprite_index = spr_pepperman_idle;
    
    if (idle_timer > 10000)
    {
        if (point_in_camera(x, y, view_camera[0]) && !instance_exists(marbledeathID))
            marbledeathID = instance_create(x, -64, obj_pepper_marbleblock);
    }
    
    if (idle_timer > 0)
    {
        idle_timer--;
    }
    else
    {
        idle_timer = idle_max - (wastedhits * 10);
        b = targetplayer;
        
        if (distance_to_object(targetblock) < 300)
            b = targetblock;
        
        if (distance_to_object(b) < 400 && b.y > (y - 64) && b.y < (y + 8))
        {
            state = UnknownEnum.Value_153;
            sprite_index = spr_pepperman_shoulderstart;
            image_index = 0;
            
            if (b.x != x)
                image_xscale = sign(b.x - x);
        }
        else
        {
            pepperman_nearestspot();
        }
    }
}

function pepperman_nearestspot()
{
    if (elitehit > 1)
    {
        if (instance_exists(obj_pepper_marbleblock))
            targetspot = instance_nearest(x, y, obj_pepper_marbleblock).parentID;
        
        if (targetspot == oldtargetspot)
        {
            do
                targetspot = instance_nearest_random(238, 3);
            until (targetspot != oldtargetspot && targetspot != undefined);
        }
    }
    else
    {
        targetspot = instance_nearest(obj_player1.x, obj_player1.y, obj_pepper_groundpoundspot);
    }
    
    state = UnknownEnum.Value_92;
    jump_speed = floor(distance_to_object(targetspot) * 0.04);
    
    if (jump_speed < 20)
        jump_speed = 20;
    
    jump_speed += floor(wastedhits / 2);
    calculate_jump_velocity(targetspot.x + 16, (targetspot.y + 16) - 200, jump_speed, grav);
    
    if (hsp > -2 && hsp < 2)
        vsp = -jump_speed;
    
    trace(hsp, " ", vsp);
    sprite_index = spr_pepperman_jump;
    image_index = 0;
}

function scr_pepperman_jump()
{
    if (hsp != 0)
        image_xscale = sign(hsp);
    
    if (x >= (targetspot.x - 32) && x <= (targetspot.x + 32) && y < (targetspot.y - 48) && !place_meeting(x, y, obj_solid))
    {
        state = UnknownEnum.Value_108;
        sprite_index = spr_pepperman_groundpound;
        vsp = 11;
        hsp = 0;
        grounded = false;
    }
    
    if (sprite_index == spr_pepperman_jump && floor(image_index) == (image_number - 1))
        sprite_index = spr_pepperman_fall;
}

function scr_pepperman_freefall()
{
    var first_spot, b, t;
    
    vsp = 20;
    
    if (grounded)
    {
        scr_soundeffect(27);
        oldtargetspot = targetspot;
        state = UnknownEnum.Value_134;
        
        if (point_in_camera(x, y, 329))
        {
            with (obj_camera)
            {
                shake_mag = 3;
                shake_mag_acc = 5 / room_speed;
            }
        }
        
        first_spot = false;
        
        if (elitehit > 1)
        {
            repeat (marbleblockmax)
            {
                b = false;
                
                do
                {
                    t = instance_random(836);
                    
                    if (!first_spot)
                    {
                        t = instance_nearest(x, y, obj_pepper_marblespot);
                        first_spot = true;
                    }
                    
                    with (t)
                    {
                        if (!instance_exists(blockID))
                        {
                            b = true;
                            
                            with (instance_create(x, -64, obj_pepper_marbleblock))
                            {
                                parentID = instance_nearest(x, y, obj_pepper_groundpoundspot);
                                other.blockID = id;
                                spotID = t;
                            }
                        }
                    }
                    
                    if (marbleblockmax >= instance_number(obj_pepper_marblespot) || (instance_number(obj_pepper_marbleblock) + instance_number(obj_pepper_marblestatue)) == instance_number(obj_pepper_marblespot))
                        b = true;
                }
                until (b);
            }
            
            idle_timer /= 3;
            idle_timer = floor(idle_timer);
        }
        else
        {
            idle_timer = 100000;
        }
    }
}

function scr_pepperman_shoulderbash()
{
    hsp = image_xscale * (8 + wastedhits);
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_pepperman_shoulderstart)
        sprite_index = spr_pepperman_shoulderloop;
    
    if ((place_meeting(x + hsp, y, obj_solid) || scr_solid_slope(x + hsp, y) || place_meeting(x + hsp, y, obj_pepper_marbleblock)) && !place_meeting(x + hsp, y, obj_destructibles))
    {
        with (instance_place(x + hsp, y, obj_pepper_marbleblock))
        {
            hp--;
            
            if (hp <= 0)
                instance_destroy();
            else
                other.idle_timer = 10;
        }
        
        state = UnknownEnum.Value_138;
        hsp = -image_xscale * 5;
        vsp = -8;
        stunned = 30;
    }
}

enum UnknownEnum
{
    Value_92 = 92,
    Value_108 = 108,
    Value_134 = 134,
    Value_138 = 138,
    Value_153 = 153
}
