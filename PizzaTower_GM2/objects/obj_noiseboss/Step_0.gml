if (room == rm_editor)
    exit;

targetplayer = instance_nearest(x, y, obj_player);
wastedhits = 8 - elitehit;

if (elitehit <= 2)
    attackpool = [UnknownEnum.Value_174, UnknownEnum.Value_130, UnknownEnum.Value_72, UnknownEnum.Value_72, UnknownEnum.Value_72];
else if (elitehit <= 4)
    attackpool = [UnknownEnum.Value_174, UnknownEnum.Value_174, UnknownEnum.Value_174, UnknownEnum.Value_130];
else if (elitehit <= 6)
    attackpool = [UnknownEnum.Value_130];

switch (state)
{
    case UnknownEnum.Value_134:
        scr_noise_walk();
        break;
    
    case UnknownEnum.Value_92:
        scr_noise_jump();
        break;
    
    case UnknownEnum.Value_80:
        scr_noise_punch();
        break;
    
    case UnknownEnum.Value_174:
        scr_noise_shield();
        break;
    
    case UnknownEnum.Value_72:
        scr_noise_pistol();
        break;
    
    case UnknownEnum.Value_137:
        scr_enemy_hit();
        break;
    
    case UnknownEnum.Value_138:
        scr_enemy_stun();
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
}

if (state != UnknownEnum.Value_108 && state != UnknownEnum.Value_111)
    hit = false;

if (state == UnknownEnum.Value_138)
{
    movespeed = 0;
    
    if (thrown)
    {
        savedthrown = true;
        placedtraps = false;
        jumpbuffer = 1;
        attacked = false;
        
        with (obj_noisetrap)
            instance_destroy();
    }
    
    if (grounded && vsp > 0 && savedthrown)
    {
        stunned = 1;
        idle_timer = 1;
    }
}
else
{
    savedthrown = false;
}

if (state == UnknownEnum.Value_138 && stunned > 100 && birdcreated == false)
{
    birdcreated = true;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state == UnknownEnum.Value_92 || (state == UnknownEnum.Value_174 && substate == UnknownEnum.Value_92))
{
    use_collision = false;
    x += hsp;
    y += vsp;
    
    if (vsp < 20)
        vsp += grav;
}
else
{
    use_collision = true;
}

if ((state == UnknownEnum.Value_72 && substate == UnknownEnum.Value_66) || (state == UnknownEnum.Value_174 && substate == UnknownEnum.Value_174) || (state == UnknownEnum.Value_134 && (!placedtraps || (!obj_player1.brick && !instance_exists(obj_brickball)))) || state == UnknownEnum.Value_80 || state == UnknownEnum.Value_138 || !use_collision)
    invincible = true;
else
    invincible = false;

if (state != UnknownEnum.Value_138)
    birdcreated = false;

if (flash == true && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

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
    Value_66 = 66,
    Value_72 = 72,
    Value_80 = 80,
    Value_92 = 92,
    Value_108 = 108,
    Value_111 = 111,
    Value_130 = 130,
    Value_134 = 134,
    Value_137 = 137,
    Value_138,
    Value_154 = 154,
    Value_155,
    Value_174 = 174
}
