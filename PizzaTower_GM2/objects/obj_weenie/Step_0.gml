if (room == rm_editor)
    exit;

if (state != UnknownEnum.Value_138 && state != UnknownEnum.Value_5)
{
    stunstate = 0;
}
else if (state == UnknownEnum.Value_138)
{
    if (stunstate == 0 && stunned > 50 && grounded)
    {
        stunstate = 1;
        stunned = 0;
        state = UnknownEnum.Value_5;
        stuntimer = stunmax;
    }
}

invincible = state == UnknownEnum.Value_5;

switch (state)
{
    case UnknownEnum.Value_126:
        scr_enemy_idle();
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
    
    case UnknownEnum.Value_5:
        grav = 0.5;
        sprite_index = spr_sausagemannocigar_rolling;
        hsp = image_xscale * 7;
        angle = 0;
        
        if (scr_solid(x + sign(hsp), y) && (!place_meeting(x, y + 1, obj_slope) || place_meeting(x + sign(hsp), y - 5, obj_solid)))
            image_xscale *= -1;
        
        if (stuntimer > 0)
            stuntimer--;
        else
            state = UnknownEnum.Value_138;
        
        if (!instance_exists(hitboxID))
        {
            hitboxID = instance_create(x, y, obj_weeniehitbox);
            hitboxID.baddieID = id;
        }
        
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

if (flash == true && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

scr_scareenemy();

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
    Value_5,
    Value_17 = 17,
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
