if (room == rm_editor)
    exit;

switch (state)
{
    case states.idle:
        scr_enemy_idle();
        break;
    
    case states.charge:
        scr_enemy_charge();
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
}

if (state == states.stun && stunned > 100 && birdcreated == false)
{
    birdcreated = true;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != states.stun)
    birdcreated = false;

scr_scareenemy();

if (flash == true && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state != states.grabbed)
    depth = 0;

if (state != states.stun)
    thrown = false;

if (bombreset > 0)
    bombreset--;

targetplayer = global.coop ? instance_nearest(x, y, obj_player) : 324;

if (sprite_index == spr_archergoblin_shoot)
    image_xscale = -sign(x - targetplayer.x);

if (x != targetplayer.x && targetplayer.state != states.bombpep && state != states.enemy_throw && bombreset == 0 && grounded)
{
    if ((targetplayer.x > (x - 200) && targetplayer.x < (x + 200)) && (y <= (targetplayer.y + 200) && y >= (targetplayer.y - 200)))
    {
        if (state == states.walk || state == states.idle)
        {
            sprite_index = spr_archergoblin_shoot;
            image_index = 0;
            image_xscale = -sign(x - targetplayer.x);
            state = states.enemy_throw;
        }
    }
}

if (instance_exists(obj_player2))
{
    if (x != obj_player2.x && obj_player2.state != states.bombpep && state != states.enemy_throw && bombreset == 0 && grounded)
    {
        if ((obj_player2.x > (x - 200) && obj_player2.x < (x + 200)) && (y <= (obj_player2.y + 200) && y >= (obj_player2.y - 200)))
        {
            if (state == states.walk || state == states.idle)
            {
                sprite_index = spr_archergoblin_shoot;
                image_index = 0;
                image_xscale = -sign(x - obj_player2.x);
                state = states.enemy_throw;
            }
        }
    }
}

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
    Value_51 = 51,
    Value_126 = 126,
    Value_128 = 128,
    Value_129,
    Value_130,
    Value_134 = 134,
    Value_136 = 136,
    Value_137,
    Value_138
}
