var player, check;

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
    
    case UnknownEnum.Value_80:
        hsp = image_xscale * chargespeed;
        
        if (chargespeed < 24)
            chargespeed += 0.3;
        
        with (obj_destructibles)
        {
            if (place_meeting(x - other.hsp, y, other))
                instance_destroy();
        }
        
        if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_slope))
        {
            state = UnknownEnum.Value_138;
            stunned = 80;
            hsp = -8 * image_xscale;
            vsp = -5;
        }
        
        break;
}

if (state == UnknownEnum.Value_134 && grounded && vsp > 0)
    hsp = 0;

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

player = instance_nearest(x, y, obj_player);
check = player.x > (x - 300) && player.x < (x + 300);

if (state == UnknownEnum.Value_134 && check && y <= (player.y + 60) && y >= (player.y - 60) && state != UnknownEnum.Value_80 && chargebuffer <= 0)
{
    state = UnknownEnum.Value_80;
    flash = true;
    sprite_index = spr_weeniesquire_charge;
    chargebuffer = 80;
    chargespeed = 6;
    hitboxcreate = true;
    
    with (instance_create(x, y, obj_forkhitbox))
    {
        ID = other.id;
        sprite_index = spr_weeniesquire_hitbox;
    }
    
    if (x != player.x)
        image_xscale = sign(player.x - x);
}

if (state != UnknownEnum.Value_80 && chargebuffer > 0)
    chargebuffer--;

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