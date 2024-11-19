var targetplayer, old_y, t;

if (room == rm_editor)
    exit;

switch (state)
{
    case states.idle:
        scr_enemy_idle();
        break;
    
    case states.turn:
        scr_enemy_turn();
        break;
    
    case states.walk:
        scr_enemy_walk();
        break;
    
    case states.land:
        scr_enemy_land();
        break;
    
    case states.hit:
        scr_enemy_hit();
        break;
    
    case states.stun:
        scr_enemy_stun();
        break;
    
    case states.enemy_throw:
        scr_pizzagoblin_throw();
        break;
    
    case states.grabbed:
        scr_enemy_grabbed();
        break;
    
    case states.charge:
        scr_enemy_charge();
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

targetplayer = global.coop ? instance_nearest(x, y, obj_player) : 324;

if ((targetplayer.x > (x - 400) && targetplayer.x < (x + 400)) && (y <= (targetplayer.y + 160) && y >= (targetplayer.y - 160)))
{
    if (state == states.walk || state == states.idle)
        activated = true;
}

if (!activated && (state == states.walk || state == states.idle))
    sprite_index = spr_banditochicken_sleep;

if ((state == states.walk || state == states.idle) && activated == true && sprite_index != spr_banditochicken_wake && sprite_index != spr_banditochicken_scared)
{
    movespeed = 0;
    image_xscale = -sign(x - targetplayer.x);
    image_index = 0;
    sprite_index = spr_banditochicken_wake;
}

if (sprite_index == spr_banditochicken_wake && floor(image_index) == (image_number - 1))
{
    image_xscale *= -1;
    sprite_index = spr_banditochicken_chase;
    state = states.charge;
    movespeed = 8;
    
    with (instance_create(x, y, obj_jumpdust))
        image_xscale = other.image_xscale;
}

if (state == states.charge && bonebuffer > 0)
    bonebuffer--;

if (grounded && jumping < 40 && state == states.charge)
    jumping++;

if (state == states.charge && grounded && jumping >= 40)
{
    vsp = -11;
    jumping = 0;
    instance_create(x, y, obj_highjumpcloud2);
}

if (bonebuffer == 0)
{
    with (instance_create(x, y, obj_banditobomb))
    {
        vsp = -9;
        image_xscale = other.image_xscale;
        hsp = 0;
        instance_create(x, y, obj_genericpoofeffect);
        old_y = y;
        t = false;
        
        while (y < room_height)
        {
            if (place_meeting(x, y, obj_solid))
            {
                y++;
            }
            else
            {
                t = true;
                break;
            }
        }
        
        if (!t)
            y = old_y;
    }
    
    bonebuffer = 100;
}

if (state != states.grabbed)
    depth = 0;

if (state != states.stun)
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
