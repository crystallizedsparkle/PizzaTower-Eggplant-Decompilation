var targetplayer, old_y, t;

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
    
    case UnknownEnum.Value_128:
        scr_enemy_charge();
        break;
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

targetplayer = global.coop ? instance_nearest(x, y, obj_player) : 324;

if ((targetplayer.x > (x - 400) && targetplayer.x < (x + 400)) && (y <= (targetplayer.y + 160) && y >= (targetplayer.y - 160)))
{
    if (state == UnknownEnum.Value_134 || state == UnknownEnum.Value_126)
        activated = true;
}

if (!activated && (state == UnknownEnum.Value_134 || state == UnknownEnum.Value_126))
    sprite_index = spr_banditochicken_sleep;

if ((state == UnknownEnum.Value_134 || state == UnknownEnum.Value_126) && activated == true && sprite_index != spr_banditochicken_wake && sprite_index != spr_banditochicken_scared)
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
    state = UnknownEnum.Value_128;
    movespeed = 8;
    
    with (instance_create(x, y, obj_jumpdust))
        image_xscale = other.image_xscale;
}

if (state == UnknownEnum.Value_128 && bonebuffer > 0)
    bonebuffer--;

if (grounded && jumping < 40 && state == UnknownEnum.Value_128)
    jumping++;

if (state == UnknownEnum.Value_128 && grounded && jumping >= 40)
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
