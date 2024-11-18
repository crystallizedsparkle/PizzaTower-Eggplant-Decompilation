var p;

if (room == rm_editor)
    exit;

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
        
        if (!instance_exists(coneID))
        {
            coneID = instance_create(x, y, obj_patrolcone);
            coneID.baddieID = id;
        }
        
        if (alarm[5] != -1)
        {
            sprite_index = spr_patroller_idle;
            hsp = 0;
        }
        
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
    
    case UnknownEnum.Value_135:
        if (grounded && vsp > 0)
        {
            image_speed = 0.35;
        }
        else
        {
            image_speed = 0;
            image_index = 0;
        }
        
        if (floor(image_index) == (image_number - 1))
        {
            state = UnknownEnum.Value_134;
            sprite_index = walkspr;
        }
        
        break;
}

if (cooldown > 0)
    cooldown--;

if (state == UnknownEnum.Value_134)
{
    if (!patrolfound)
    {
        if (cooldown <= 0 && alarm[5] == -1 && instance_exists(coneID) && coneID.collision)
        {
            patroltimer = patroltimermax;
            patrolfound = true;
            alarm[5] = 60;
        }
    }
    else if (alarm[5] == -1)
    {
        alarm[5] = 60;
    }
}

if (state == UnknownEnum.Value_134 && point_in_camera(x, y, view_camera[0]))
{
    p = false;
    
    with (obj_player)
    {
        if (state == UnknownEnum.Value_84 && sprite_index == spr_taunt)
            p = true;
    }
    
    if (p)
    {
        patroltimer = 0;
        alarm[5] = 1;
    }
}

if (state == UnknownEnum.Value_80)
{
    hsp = 0;
    
    if (floor(image_index) == (image_number - 1))
    {
        state = UnknownEnum.Value_134;
        sprite_index = walkspr;
        cooldown = 100;
    }
}

if (state == UnknownEnum.Value_138 || state == UnknownEnum.Value_4 || state == UnknownEnum.Value_137)
    alarm[5] = -1;

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
    Value_17 = 17,
    Value_80 = 80,
    Value_84 = 84,
    Value_125 = 125,
    Value_126,
    Value_129 = 129,
    Value_130,
    Value_134 = 134,
    Value_135,
    Value_136,
    Value_137,
    Value_138,
    Value_154 = 154,
    Value_155
}
