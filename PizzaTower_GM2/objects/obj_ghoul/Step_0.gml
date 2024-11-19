var x1, t, d;

if (room == rm_editor)
    exit;

image_speed = 0.35;

switch (state)
{
    case states.idle:
        sprite_index = idlespr;
        playerid = instance_nearest(x, y, obj_player);
        x1 = 370;
        
        if (image_xscale > 0)
            t = playerid.x > (x - 16) && playerid.x < (x + x1) && playerid.y > (y - 16) && playerid.y < (y + 200);
        else
            t = playerid.x < (x + 16) && playerid.x > (x - x1) && playerid.y > (y - 16) && playerid.y < (y + 200);
        
        if (cooldown > 0)
        {
            cooldown--;
        }
        else if (t)
        {
            state = states.transitioncutscene;
            sprite_index = spr_ghoul_attackstart;
            image_index = 0;
            attack_y = y;
        }
        
        break;
    
    case states.charge:
        scr_enemy_charge();
        break;
    
    case states.walk:
        sprite_index = idlespr;
        d = point_direction(x, y, xstart, ystart);
        x += lengthdir_x(8, d);
        y += lengthdir_y(8, d);
        hsp = 0;
        vsp = 0;
        
        if (x > (xstart - 10) && x < (xstart + 10) && y > (ystart - 10) && y < (ystart + 10))
        {
            state = states.idle;
            image_xscale = start_xscale;
            cooldown = 100;
            x = xstart;
            y = ystart;
        }
        else
        {
            image_xscale = sign(x - xstart);
        }
        
        break;
    
    case states.transitioncutscene:
        hsp = 0;
        vsp = 0;
        
        if (floor(image_index) == (image_number - 1))
        {
            state = states.punch;
            vsp = 11;
            attack_y = y;
            sprite_index = spr_ghoul_attack;
        }
        
        break;
    
    case states.punch:
        vsp = Approach(vsp, -11, 0.5);
        hsp = image_xscale * 10;
        x += hsp;
        y += vsp;
        
        if (y < attack_y && vsp < 0)
        {
            y = attack_y;
            vsp = 0;
            state = states.idle;
            cooldown = 100;
            image_xscale *= -1;
        }
        
        break;
    
    case states.turn:
        break;
    
    case states.land:
        scr_enemy_land();
        break;
    
    case states.hit:
        scr_enemy_hit();
        break;
    
    case states.stun:
        scr_enemy_stun();
        hit = true;
        break;
    
    case states.enemy_throw:
        scr_pizzagoblin_throw();
        break;
    
    case states.grabbed:
        scr_enemy_grabbed();
        break;
    
    case states.pummel:
        scr_enemy_pummel();
        break;
    
    case states.staggered:
        scr_enemy_staggered();
        break;
}

if (state == states.stun && stunned > 100 && birdcreated == false)
{
    birdcreated = true;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != states.stun)
    birdcreated = false;

if (flash == true && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state != states.grabbed)
    depth = 0;

if (state != states.stun)
    thrown = false;

if (bombreset > 0)
    bombreset--;

if (grounded && state == states.enemy_throw && floor(image_index) == 3)
    vsp = -5;

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
    Value_8 = 8,
    Value_80 = 80,
    Value_126 = 126,
    Value_128 = 128,
    Value_129,
    Value_130,
    Value_134 = 134,
    Value_136 = 136,
    Value_137,
    Value_138,
    Value_154 = 154,
    Value_155
}
