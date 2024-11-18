var targetplayer, inst_front, inst_down, inst_down2, inst_up;

event_inherited();

if (room == rm_editor)
    exit;

targetplayer = global.coop ? instance_nearest(x, y, obj_player) : 324;

if (bombreset > 0)
    bombreset--;

if (state == UnknownEnum.Value_134)
{
    if (!chasing)
    {
        targetplayer = instance_nearest(x, y, obj_player);
        
        if ((targetplayer.x > (x - 1900) && targetplayer.x < (x + 1900)) && (y <= (targetplayer.y + 540) && y >= (targetplayer.y - 540)))
        {
            chasing = true;
            
            if (x != targetplayer.x)
                image_xscale = -sign(x - targetplayer.x);
            
            image_index = 0;
            sprite_index = spr_shrimp_knife;
            state = UnknownEnum.Value_129;
            bombreset = 0;
            hsp = 0;
        }
    }
    else
    {
        state = UnknownEnum.Value_141;
        sprite_index = walkspr;
        image_index = 0;
    }
}
else if (state == UnknownEnum.Value_141)
{
    if (sprite_index == spr_shrimp_throw)
        sprite_index = spr_shrimp_walk;
    
    move = sign(targetplayer.x - x);
    
    if (move != 0)
        image_xscale = move;
    
    if (chasespeed < 4)
        chasespeed += 0.25;
    
    if (abs(x - targetplayer.x) < 230)
    {
        hsp = -move * chasespeed;
        
        if (move != 0 && move != -dir)
            movespeed = 2;
    }
    else if (abs(x - targetplayer.x) > 240)
    {
        hsp = move * chasespeed;
        
        if (move != 0 && move != dir)
            chasespeed = 2;
    }
    else
    {
        hsp = 0;
        chasespeed = 0;
    }
    
    inst_front = collision_line(x, y + 25, x + (sign(hsp) * 78), y + 25, obj_solid, false, true);
    
    if (bombreset == 0)
    {
        if ((targetplayer.x > (x - attackthreshold_x) && targetplayer.x < (x + attackthreshold_x)) && (targetplayer.y > (y - attackthreshold_y) && targetplayer.y < (y + attackthreshold_y)) && (inst_front == -4 || (inst_front != -4 && x > inst_front.x && targetplayer.x > inst_front.x) || (inst_front != -4 && x < inst_front.x && targetplayer.x < inst_front.x)))
        {
            state = UnknownEnum.Value_128;
            hsp = 0;
            attack_count = attack_max;
        }
    }
    
    inst_down = collision_line(x + (sign(hsp) * 16), y, x + (sign(hsp) * 16), y + 64, obj_solid, false, true);
    inst_down2 = collision_line(x + (sign(hsp) * 16), y, x + (sign(hsp) * 16), y + 64, obj_platform, false, true);
    inst_up = collision_line(x + (sign(hsp) * 96), y + 25, x + (sign(hsp) * 96), (y - 78) + 50, obj_platform, false, true);
    
    if (image_index > (image_number - 1))
    {
        if (sprite_index == spr_shrimp_jump)
        {
            sprite_index = spr_shrimp_fall;
            image_index = 0;
        }
        else if (sprite_index == spr_shrimp_land)
        {
            sprite_index = spr_shrimp_walk;
            image_index = 0;
        }
    }
    
    if (grounded && sprite_index == spr_shrimp_fall)
    {
        sprite_index = spr_shrimp_land;
        image_index = 0;
    }
    
    if (((inst_front != -4 || inst_up != -4) || (inst_down == -4 && inst_down2 == -4)) && targetplayer.y <= (y + 32) && grounded && state != UnknownEnum.Value_128)
    {
        vsp = -11;
        sprite_index = spr_shrimp_jump;
        image_index = 0;
        hsp = image_xscale * chasespeed;
    }
}

if (state == UnknownEnum.Value_128)
{
    if (attack_count > 0)
    {
        attack_count--;
    }
    else
    {
        image_index = 0;
        sprite_index = spr_shrimp_knife;
        bombreset = 0;
        state = UnknownEnum.Value_129;
        hsp = 0;
    }
}

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
        chasing = true;
        scr_enemy_stun();
        break;
    
    case UnknownEnum.Value_129:
        scr_pizzagoblin_throw();
        break;
    
    case UnknownEnum.Value_4:
        chasing = true;
        scr_enemy_grabbed();
        break;
    
    case UnknownEnum.Value_125:
        scr_enemy_rage();
        break;
}

if (state == UnknownEnum.Value_138 && stunned > 100 && birdcreated == false)
{
    birdcreated = true;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (sprite_index == scaredspr && state == UnknownEnum.Value_126)
    invincible = false;

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
    Value_125 = 125,
    Value_126,
    Value_128 = 128,
    Value_129,
    Value_130,
    Value_134 = 134,
    Value_136 = 136,
    Value_137,
    Value_138,
    Value_141 = 141
}
