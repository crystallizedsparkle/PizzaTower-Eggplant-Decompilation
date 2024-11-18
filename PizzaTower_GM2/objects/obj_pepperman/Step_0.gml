if (room == rm_editor)
    exit;

targetplayer = instance_nearest(x, y, obj_player);
targetblock = instance_nearest(x, y, obj_pepper_marbleblock);
wastedhits = 8 - elitehit;

switch (state)
{
    case UnknownEnum.Value_134:
        scr_pepperman_walk();
        break;
    
    case UnknownEnum.Value_153:
        scr_pepperman_shoulderbash();
        break;
    
    case UnknownEnum.Value_92:
        scr_pepperman_jump();
        break;
    
    case UnknownEnum.Value_108:
        scr_pepperman_freefall();
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

if (state == UnknownEnum.Value_138)
{
    if (thrown)
        savedthrown = true;
    
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

if (state == UnknownEnum.Value_92)
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

if (state == UnknownEnum.Value_138 || state == UnknownEnum.Value_153 || !use_collision || elitehit <= 1)
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
    Value_92 = 92,
    Value_108 = 108,
    Value_134 = 134,
    Value_137 = 137,
    Value_138,
    Value_153 = 153,
    Value_154,
    Value_155
}
