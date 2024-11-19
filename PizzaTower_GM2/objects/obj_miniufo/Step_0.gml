var player;

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

if (state == states.walk && y > ystart && !scr_solid(x, y - 1))
    y--;

if (state == states.walk && y < ystart && !scr_solid(x, y + 1))
    y++;

if (state == states.stun)
    grav = 0.5;
else
    grav = 0;

if (bombreset > 0 && state == states.walk)
    bombreset--;

player = instance_nearest(x, y, obj_player);

if (ragebuffer > 0)
    ragebuffer--;

if (flash == true && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state == states.enemy_throw || state == states.rage)
{
    hsp = 0;
    vsp = 0;
}

if (state != states.grabbed)
    depth = 0;

scr_scareenemy();

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
    Value_125 = 125,
    Value_126,
    Value_128 = 128,
    Value_129,
    Value_130,
    Value_134 = 134,
    Value_136 = 136,
    Value_137,
    Value_138
}
