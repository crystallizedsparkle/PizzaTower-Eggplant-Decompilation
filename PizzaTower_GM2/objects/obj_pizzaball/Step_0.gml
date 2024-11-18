if (room == rm_editor)
    exit;

if (state == UnknownEnum.Value_134 && grounded && vsp > 0 && obj_player.state == UnknownEnum.Value_111)
    scr_pizzaball_go_to_thrown(0, -10);

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
        scr_pizzaball_hit();
        break;
    
    case UnknownEnum.Value_148:
        scr_pizzaball_golf();
        break;
    
    case UnknownEnum.Value_156:
        scr_pizzaball_thrown();
        break;
    
    case UnknownEnum.Value_138:
        scr_pizzaball_go_to_thrown(0, vsp * 0.5);
        break;
    
    case UnknownEnum.Value_129:
        scr_pizzagoblin_throw();
        break;
    
    case UnknownEnum.Value_4:
        scr_pizzaball_grabbed();
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
}

if ((state == UnknownEnum.Value_134 || state == UnknownEnum.Value_126) && sit)
{
    hsp = 0;
    sprite_index = spr_pizzaball_idle1;
}

if (state != UnknownEnum.Value_134)
    sit = false;

if (state == UnknownEnum.Value_138 && stunned > 100 && birdcreated == false)
{
    birdcreated = true;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state == UnknownEnum.Value_156 && !instance_exists(pointerID))
{
    pointerID = instance_create(x, y, obj_objecticontracker);
    pointerID.sprite_index = spr_icon_pizzaball;
    pointerID.objectID = id;
}

if (state != UnknownEnum.Value_138)
    birdcreated = false;

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

if (state == UnknownEnum.Value_156)
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
