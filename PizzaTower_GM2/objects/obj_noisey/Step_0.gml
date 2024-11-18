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
}

walkspr = (phase == 0) ? 22 : 2666;

if (state == UnknownEnum.Value_134)
{
    if (object_index == obj_noisey && phase == 1)
    {
        if (grounded && sprite_index != spr_noisey_bounceland && vsp > 0)
        {
            image_index = 0;
            sprite_index = spr_noisey_bounceland;
        }
        
        if (sprite_index == spr_noisey_bounceland)
        {
            if (floor(image_index) == (image_number - 1))
                sprite_index = spr_noisey_bouncefall;
            
            if (floor(image_index) == 4)
                vsp = -6;
        }
    }
}

if (lasthp != hp && phase == 0 && state == UnknownEnum.Value_138 && grounded)
{
    lasthp = hp;
    phase = 1;
    stunned = 5;
    killprotection = false;
}

if (state == UnknownEnum.Value_138 && stunned > 100 && birdcreated == false)
{
    birdcreated = true;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != UnknownEnum.Value_138)
    birdcreated = false;

scr_scareenemy();

if (flash == true && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (hitboxcreate == false && state == UnknownEnum.Value_134)
{
    hitboxcreate = true;
    
    with (instance_create(x, y, obj_forkhitbox))
        ID = other.id;
}

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
    Value_126 = 126,
    Value_128 = 128,
    Value_129,
    Value_130,
    Value_134 = 134,
    Value_136 = 136,
    Value_137,
    Value_138
}
