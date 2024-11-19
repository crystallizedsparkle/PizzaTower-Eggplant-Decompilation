if (room == rm_editor)
    exit;

if (state == states.walk && grounded && vsp > 0 && obj_player.state == states.freefallland)
    scr_pizzaball_go_to_thrown(0, -10);

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
        scr_pizzaball_hit();
        break;
    
    case states.golf:
        scr_pizzaball_golf();
        break;
    
    case states.thrown:
        scr_pizzaball_thrown();
        break;
    
    case states.stun:
        scr_pizzaball_go_to_thrown(0, vsp * 0.5);
        break;
    
    case states.enemy_throw:
        scr_pizzagoblin_throw();
        break;
    
    case states.grabbed:
        scr_pizzaball_grabbed();
        break;
    
    case states.pummel:
        scr_enemy_pummel();
        break;
    
    case states.staggered:
        scr_enemy_staggered();
        break;
    
    case states.rage:
        scr_enemy_rage();
        break;
    
    case states.ghostpossess:
        scr_enemy_ghostpossess();
        break;
}

if ((state == states.walk || state == states.idle) && sit)
{
    hsp = 0;
    sprite_index = spr_pizzaball_idle1;
}

if (state != states.walk)
    sit = false;

if (state == states.stun && stunned > 100 && birdcreated == false)
{
    birdcreated = true;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state == states.thrown && !instance_exists(pointerID))
{
    pointerID = instance_create(x, y, obj_objecticontracker);
    pointerID.sprite_index = spr_icon_pizzaball;
    pointerID.objectID = id;
}

if (state != states.stun)
    birdcreated = false;

if (flash == true && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

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

if (state == states.thrown)
{
    with (instance_place(x + xscale, y, obj_destructibles))
        instance_destroy();
    
    with (instance_place(x + hsp + xscale, y, obj_destructibles))
        instance_destroy();
    
    with (instance_place(x, y + vsp + 1, obj_destructibles))
        instance_destroy();
    
    with (instance_place(x, (y + vsp) - 1, obj_destructibles))
        instance_destroy();
    
    with (instance_place(x, y + 1, obj_destructibles))
        instance_destroy();
    
    with (instance_place(x, y - 1, obj_destructibles))
        instance_destroy();
}

enum UnknownEnum
{
    Value_4 = 4,
    Value_17 = 17,
    Value_111 = 111,
    Value_125 = 125,
    Value_126,
    Value_129 = 129,
    Value_130,
    Value_134 = 134,
    Value_136 = 136,
    Value_137,
    Value_138,
    Value_148 = 148,
    Value_154 = 154,
    Value_155,
    Value_156
}
