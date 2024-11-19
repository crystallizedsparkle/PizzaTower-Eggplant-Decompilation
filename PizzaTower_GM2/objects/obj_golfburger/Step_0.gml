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

if (state == states.throwing)
{
    hsp = 0;
    
    if (floor(image_index) == (image_number - 1))
    {
        state = states.walk;
        sprite_index = walkspr;
    }
    
    if (!shot)
    {
        with (golfid)
        {
            hsp = 0;
            vsp = 0;
            sprite_index = stunfallspr;
            image_xscale = other.image_xscale;
            x = other.x + (other.image_xscale * 24);
            y = other.y + 23;
        }
    }
    
    if (floor(image_index) >= 6 && !shot)
    {
        shot = true;
        
        with (golfid)
        {
            x = other.x;
            y = other.y;
            scr_pizzaball_go_to_thrown(14 * other.image_xscale, -7, false);
        }
    }
}

scr_scareenemy();

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
    Value_17 = 17,
    Value_74 = 74,
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
