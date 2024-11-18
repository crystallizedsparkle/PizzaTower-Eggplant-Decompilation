var targetplayer, mv;

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
    
    case UnknownEnum.Value_106:
        sprite_index = spr_badrat_stun;
        
        if (grounded && vsp > 0)
        {
            state = UnknownEnum.Value_134;
            sprite_index = walkspr;
        }
        
        break;
}

targetplayer = instance_nearest(x, y, obj_player);

if (cooldown > 0)
    cooldown--;

if (state == UnknownEnum.Value_134 && cooldown <= 0)
{
    if (targetplayer.x > (x - 200) && targetplayer.x < (x + 200) && targetplayer.y > (y - 50) && targetplayer.y < (y + 50))
    {
        state = UnknownEnum.Value_80;
        sprite_index = spr_badrat_attack1;
        image_index = 0;
        
        if (x != targetplayer.x)
            image_xscale = sign(targetplayer.x - x);
    }
}

if (state == UnknownEnum.Value_80)
{
    mv = 8;
    image_speed = 0.35;
    
    if (sprite_index == spr_badrat_attack1)
    {
        hsp = 0;
        
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = spr_badrat_attack2;
            cooldown = 30;
        }
    }
    else if (sprite_index == spr_badrat_attack2)
    {
        hsp = image_xscale * mv;
        vsp = 0;
        
        if (!instance_exists(hitboxID))
        {
            hitboxID = instance_create(x, y, obj_forkhitbox);
            hitboxID.ID = id;
        }
        
        if (cooldown > 0)
            cooldown--;
        else if (grounded || (place_meeting(x + sign(hsp), y, obj_solid) && !place_meeting(x + sign(hsp), y, obj_slope)))
            sprite_index = spr_badrat_attack2end;
    }
    else if (sprite_index == spr_badrat_attack2end)
    {
        hsp = image_xscale * mv;
        
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = spr_badrat_attack3;
            instance_destroy(hitboxID);
        }
    }
    else
    {
        hsp = Approach(hsp, 0, 0.2);
        
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = walkspr;
            state = UnknownEnum.Value_134;
            instance_destroy(hitboxID);
            cooldown = 80;
        }
    }
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

if (place_meeting(x, y, obj_canonexplosion))
    instance_destroy();

if (state != UnknownEnum.Value_4)
    depth = 0;

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

if (state != UnknownEnum.Value_138)
    thrown = false;

enum UnknownEnum
{
    Value_4 = 4,
    Value_17 = 17,
    Value_80 = 80,
    Value_106 = 106,
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
