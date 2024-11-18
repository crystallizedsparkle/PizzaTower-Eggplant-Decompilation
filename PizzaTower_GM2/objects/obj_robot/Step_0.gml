var _railinst;

switch (state)
{
    case UnknownEnum.Value_126:
        scr_enemy_idle();
        break;
    
    case UnknownEnum.Value_128:
        scr_enemy_charge();
        break;
    
    case UnknownEnum.Value_130:
        scr_enemy_turn();
        break;
    
    case UnknownEnum.Value_134:
        scr_enemy_walk();
        break;
    
    case UnknownEnum.Value_136:
        scr_enemy_land();
        break;
    
    case UnknownEnum.Value_137:
        scr_enemy_hit();
        break;
    
    case UnknownEnum.Value_138:
        scr_enemy_stun();
        break;
    
    case UnknownEnum.Value_129:
        scr_pizzagoblin_throw();
        break;
    
    case UnknownEnum.Value_4:
        scr_enemy_grabbed();
        break;
    
    case UnknownEnum.Value_103:
        if (image_index > (image_number - 1))
        {
            hsp = image_xscale * startmachspeed;
            
            if (place_meeting(x, y + 1, obj_railparent))
            {
                _railinst = instance_place(x, y + 1, obj_railparent);
                hsp += (_railinst.movespeed * _railinst.dir);
            }
            
            sprite_index = spr_robot_mach;
            image_index = 0;
            state = UnknownEnum.Value_104;
        }
        
        break;
    
    case UnknownEnum.Value_104:
        hsp = Approach(hsp, image_xscale * machspeed, 0.5) + railmovespeed;
        
        if (place_meeting(x, y + 1, obj_railparent))
        {
            _railinst = instance_place(x, y + 1, obj_railparent);
            railmovespeed = _railinst.movespeed * _railinst.dir;
        }
        else
        {
            railmovespeed = 0;
        }
        
        with (instance_place(x + hsp, y, obj_destructibles))
            instance_destroy();
        
        if (place_meeting(x + sign(hsp), y, obj_solid) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x, y, obj_destructibles))
        {
            state = UnknownEnum.Value_138;
            stunned = 100;
            vsp = -4;
            hsp = -image_xscale * 2;
        }
        
        break;
    
    case UnknownEnum.Value_91:
        if (image_index > 8)
        {
            hsp = image_xscale * tacklespeed;
            
            if (place_meeting(x, y + 1, obj_railparent))
            {
                _railinst = instance_place(x, y + 1, obj_railparent);
                hsp += (_railinst.movespeed * _railinst.dir);
            }
            
            with (instance_place(x + hsp, y, obj_destructibles))
                instance_destroy();
        }
        
        if (image_index > (image_number - 1))
        {
            state = UnknownEnum.Value_134;
            hsp = 0;
            railspeed = 0;
            sprite_index = walkspr;
        }
        
        if (place_meeting(x + sign(hsp), y, obj_solid) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x, y, obj_destructibles))
        {
            state = UnknownEnum.Value_138;
            stunned = 100;
            vsp = -8;
            hsp = -image_xscale * 5;
        }
        
        break;
    
    case UnknownEnum.Value_23:
        hsp = 0;
        
        if (image_index > (image_number - 1))
        {
            state = UnknownEnum.Value_134;
            sprite_index = walkspr;
        }
        
        break;
}

if (state == UnknownEnum.Value_138 && stunned > 40 && birdcreated == false)
{
    birdcreated = true;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != UnknownEnum.Value_138)
    birdcreated = false;

if (flash == true && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state != UnknownEnum.Value_4)
    depth = 0;

if (state != UnknownEnum.Value_138)
    thrown = false;

if (bombreset > 0)
    bombreset--;

invincible = state == UnknownEnum.Value_104;
targetplayer = instance_nearest(x, y, obj_player);

if (x != targetplayer.x && state != UnknownEnum.Value_129 && bombreset == 0)
{
    if ((targetplayer.x > (x - 400) && targetplayer.x < (x + 400)) && (y <= (targetplayer.y + 20) && y >= (targetplayer.y - 20)))
    {
        if (state == UnknownEnum.Value_134 || state == UnknownEnum.Value_126)
        {
            image_index = 0;
            image_xscale = -sign(x - targetplayer.x);
            state = chosenstate;
            bombreset = 100;
            
            switch (state)
            {
                case UnknownEnum.Value_103:
                    sprite_index = spr_robot_machstart;
                    image_index = 0;
                    image_speed = 0.6;
                    hsp = 0;
                    break;
                
                case UnknownEnum.Value_129:
                    bombreset = 0;
                    sprite_index = spr_robot_attack;
                    image_index = 0;
                    image_speed = 0.35;
                    hsp = 0;
                    break;
                
                case UnknownEnum.Value_91:
                    sprite_index = spr_robot_tackle;
                    image_index = 0;
                    image_speed = 0.6;
                    hsp = 0;
                    break;
                
                case UnknownEnum.Value_23:
                    sprite_index = spr_robot_slap;
                    image_index = 0;
                    image_speed = 0.6;
                    hsp = 0;
                    break;
            }
        }
    }
}

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

if (state == UnknownEnum.Value_104 || (state == UnknownEnum.Value_23 && image_index > 11) || (state == UnknownEnum.Value_91 && image_index > 8))
{
    if (!hitboxcreate)
    {
        hitboxcreate = true;
        
        with (instance_create(x, y, obj_forkhitbox))
        {
            if (other.state == UnknownEnum.Value_23)
                sprite_index = spr_swordhitbox;
            else if (other.state == UnknownEnum.Value_104 || other.state == UnknownEnum.Value_91)
                sprite_index = spr_bighitbox;
            
            ID = other.id;
        }
    }
}
else
{
    hitboxcreate = false;
}

enum UnknownEnum
{
    Value_4 = 4,
    Value_23 = 23,
    Value_91 = 91,
    Value_103 = 103,
    Value_104,
    Value_126 = 126,
    Value_128 = 128,
    Value_129,
    Value_130,
    Value_134 = 134,
    Value_136 = 136,
    Value_137,
    Value_138
}
