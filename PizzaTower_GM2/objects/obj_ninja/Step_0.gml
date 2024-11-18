var b, s;

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

if (sprite_index != spr_pizzaboy)
    usepalette = true;

scr_scareenemy();

if (state == UnknownEnum.Value_138 && stunned > 40 && birdcreated == false)
{
    birdcreated = true;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != UnknownEnum.Value_138)
    birdcreated = false;

targetplayer = instance_nearest(x, y, obj_player);

if (state == UnknownEnum.Value_134)
{
    if (sprite_index == spr_pizzaboy)
    {
        hsp = 0;
    }
    else
    {
        move = sign(targetplayer.x - x);
        
        if (move != 0)
            image_xscale = move;
        
        if (movespeed < 4)
            movespeed += 0.25;
        
        if (abs(x - targetplayer.x) < 230)
        {
            hsp = -move * movespeed;
            
            if (move != 0 && move != -dir)
                movespeed = 2;
        }
        else if (abs(x - targetplayer.x) > 240)
        {
            hsp = move * movespeed;
            
            if (move != 0 && move != dir)
                movespeed = 2;
        }
        else
        {
            hsp = 0;
            movespeed = 0;
        }
        
        trace(movespeed, "   ", hsp);
        
        if (hsp != 0)
            dir = sign(hsp);
        
        if (place_meeting(x, y, obj_ninja) || place_meeting(x + hsp, y, obj_ninja))
        {
            b = instance_place(x, y, obj_ninja);
            s = 2;
            
            if (!instance_exists(b))
            {
                s = 0;
                b = instance_place(x + hsp, y, obj_ninja);
            }
            
            if (b.id < id)
                hsp = -sign(b.dir) * s;
        }
    }
}
else if (state == UnknownEnum.Value_80)
{
    image_speed = 0.35;
    hsp = 0;
    
    if (floor(image_index) == (image_number - 1))
    {
        state = UnknownEnum.Value_134;
        sprite_index = walkspr;
    }
    
    if (image_index > 4 && image_index < 14)
    {
        if (!hitboxcreate)
        {
            hitboxcreate = true;
            
            with (instance_create(x, y, obj_forkhitbox))
            {
                sprite_index = spr_bighitbox;
                mask_index = spr_bighitbox;
                ID = other.id;
            }
        }
    }
    
    if (sprite_index == spr_ninja_punchattack)
    {
        if (floor(image_index) != 5 && floor(image_index) != 8 && floor(image_index) != 11)
        {
            shot = false;
        }
        else if (!shot)
        {
            with (instance_create(x, y + 6, obj_enemybullet))
                image_xscale = other.image_xscale;
        }
    }
}

if (sprite_index == spr_pizzaboy)
{
    if (x != targetplayer.x && targetplayer.x > (x - 200) && targetplayer.x < (x + 200) && targetplayer.y > (y - 150) && targetplayer.y < (y + 20))
    {
        if (state == UnknownEnum.Value_134 || state == UnknownEnum.Value_126)
        {
            if (sprite_index == spr_pizzaboy)
                create_particle(x, y, UnknownEnum.Value_6, 0);
            
            image_xscale = -sign(x - targetplayer.x);
            sprite_index = spr_ninja_uppercut;
            image_index = 0;
            state = UnknownEnum.Value_128;
            roaming = true;
            vsp = -14;
            hsp = image_xscale * 4;
            inv_timer = 5;
            alarm[4] = 5;
            
            with (instance_create(x, y, obj_forkhitbox))
            {
                sprite_index = spr_bighitbox;
                mask_index = spr_bighitbox;
                ID = other.id;
            }
        }
    }
}
else if (state == UnknownEnum.Value_134 && attack_buffer <= 0)
{
    attack_buffer = attack_max + irandom_range(-attack_random, attack_random);
    state = UnknownEnum.Value_80;
    hsp = 0;
    hitboxcreate = false;
    
    if (global.stylethreshold < 3)
    {
        sprite_index = spr_ninja_kickattack;
        image_index = 0;
    }
    
    if (global.stylethreshold >= 3 || elite)
    {
        sprite_index = spr_ninja_punchattack;
        image_index = 0;
    }
}

if (attack_buffer > 0)
    attack_buffer--;

if (inv_timer > 0)
{
    inv_timer--;
    invincible = true;
}
else
{
    invincible = false;
}

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
    Value_6 = 6,
    Value_80 = 80,
    Value_126 = 126,
    Value_128 = 128,
    Value_129,
    Value_130,
    Value_134 = 134,
    Value_136 = 136,
    Value_137,
    Value_138
}
