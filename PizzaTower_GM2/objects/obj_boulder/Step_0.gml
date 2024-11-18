var _inst, _railinst;

switch (state)
{
    case UnknownEnum.Value_126:
        if (!active)
        {
            hsp = 0;
            vsp = 0;
            sprite_index = spr_meatball_idle;
            
            if (point_in_camera(x, y, view_camera[0]) && (obj_camera.shake_mag >= 10 || obj_player.state == UnknownEnum.Value_111))
            {
                active = true;
                sprite_index = spr_meatball_roll;
            }
        }
        else if (grounded)
        {
            state = UnknownEnum.Value_134;
        }
        
        break;
    
    case UnknownEnum.Value_130:
        scr_enemy_turn();
        break;
    
    case UnknownEnum.Value_134:
        hsp = image_xscale * b_movespeed;
        
        if (b_movespeed < 6)
            b_movespeed += 0.5;
        
        if (scr_slope())
        {
            _inst = instance_place(x, y + 1, obj_slope);
            
            if (sign(_inst.image_xscale) == -sign(image_xscale))
            {
                b_movespeed += 0.15;
                
                if (b_movespeed > 26)
                    b_movespeed = 26;
            }
        }
        else if (b_movespeed > 6)
        {
            b_movespeed -= 0.05;
        }
        
        if (scr_solid(x + sign(hsp), y) && (!scr_slope() || (scr_solid_slope(x + sign(hsp), y - 2) || scr_solid(x + sign(hsp), y - 2))) && !place_meeting(x + sign(hsp), y, obj_destructibles))
            image_xscale *= -1;
        
        with (instance_place(x + sign(hsp), y, obj_destructibles))
            instance_destroy();
        
        break;
    
    case UnknownEnum.Value_136:
        scr_enemy_land();
        break;
    
    case UnknownEnum.Value_137:
        scr_enemy_hit();
        break;
    
    case UnknownEnum.Value_138:
        if (global.attackstyle != 2)
        {
            switch (hp)
            {
                case -1:
                    grav = 1.1;
                    break;
                
                case -2:
                    grav = 1.3;
                    break;
            }
        }
        
        switch (global.stylethreshold)
        {
            case 0:
                stunned -= 0.5;
                break;
            
            case 1:
                stunned -= 0.65;
                break;
            
            case 2:
                stunned -= 0.8;
                break;
            
            case 3:
                stunned -= 1;
        }
        
        if (stuntouchbuffer > 0)
            stuntouchbuffer--;
        
        sprite_index = stunfallspr;
        image_speed = 0.35;
        
        if ((grounded || (grounded && !place_meeting(x, y, obj_platform))) && vsp > 0 && !place_meeting(x + hsp, y, obj_destructibles))
        {
            if (thrown == true && destroyable)
                instance_destroy();
            
            hsp = 0;
            thrown = false;
        }
        
        if (hitvsp < 0 && place_meeting(x, y - 1, obj_solid) && !place_meeting(x, y - 1, obj_destructibles))
        {
            if (thrown == true && destroyable)
                instance_destroy();
            
            thrown = false;
        }
        
        if (hithsp != 0 && place_meeting(x - image_xscale, y, obj_solid) && !place_meeting(x - image_xscale, y, obj_destructibles))
        {
            particle_set_scale(UnknownEnum.Value_8, -image_xscale, 1);
            create_particle(x, y, UnknownEnum.Value_8, 0);
            
            if (thrown == true && destroyable)
                instance_destroy();
            
            thrown = false;
        }
        
        if (stunned <= 0 && grounded)
        {
            vsp = 0;
            image_index = 0;
            sprite_index = walkspr;
            state = UnknownEnum.Value_134;
        }
        
        if (place_meeting(x, y + 1, obj_railparent))
        {
            _railinst = instance_place(x, y + 1, obj_railparent);
            hsp += (_railinst.movespeed * _railinst.dir);
        }
        
        grav = 0.5;
        break;
    
    case UnknownEnum.Value_129:
        scr_pizzagoblin_throw();
        break;
    
    case UnknownEnum.Value_4:
        scr_enemy_grabbed();
        break;
    
    case UnknownEnum.Value_154:
        scr_enemy_pummel();
        break;
    
    case UnknownEnum.Value_155:
        scr_enemy_staggered();
        break;
    
    case UnknownEnum.Value_125:
        scr_enemy_rage();
        break;
    
    case UnknownEnum.Value_17:
        scr_enemy_ghostpossess();
        break;
}

if (state == UnknownEnum.Value_138 && stunned > 100 && birdcreated == false)
{
    birdcreated = true;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != UnknownEnum.Value_138)
    birdcreated = false;

if (state == UnknownEnum.Value_138)
{
    if (stuntouchbuffer > 0)
        stuntouched = true;
    
    if (grounded && stunned > 1 && stuntouchbuffer <= 0)
    {
        stunned = 1;
        
        if (!stuntouched)
            image_xscale *= -1;
    }
}
else
{
    stuntouched = false;
}

if (flash == true && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

angle = 0;
flash = false;

if (state != UnknownEnum.Value_4)
    depth = 0;

if (state != UnknownEnum.Value_138)
    thrown = false;

if (boundbox == false)
{
    with (instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index;
        mask_index = other.sprite_index;
        baddieID = other.id;
        other.boundbox = true;
    }
}

enum UnknownEnum
{
    Value_4 = 4,
    Value_8 = 8,
    Value_17 = 17,
    Value_111 = 111,
    Value_125 = 125,
    Value_126,
    Value_129 = 129,
    Value_130,
    Value_134 = 134,
    Value_136 = 136,
    Value_137,
    Value_138,
    Value_154 = 154,
    Value_155
}
