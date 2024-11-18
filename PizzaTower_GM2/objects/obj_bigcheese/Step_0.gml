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

if (state == UnknownEnum.Value_134)
{
    hsp = 0;
}
else if (state == UnknownEnum.Value_74)
{
    hsp = 0;
    
    if (floor(image_index) == (image_number - 1))
    {
        state = UnknownEnum.Value_134;
        sprite_index = spr_bigcheese_idle;
    }
    
    if (!shot)
    {
        if (!pizzaball)
        {
            with (playerid)
            {
                xscale = other.image_xscale;
                hsp = 0;
                vsp = 0;
                state = UnknownEnum.Value_5;
                jumpstop = true;
                x = other.x;
                y = other.y;
            }
        }
        else
        {
            with (golfid)
            {
                image_xscale = other.image_xscale;
                x = other.x;
                y = other.y;
                hsp = 0;
                vsp = 0;
                hsp_carry = 0;
                vsp_carry = 0;
            }
        }
    }
    
    if (floor(image_index) > 2 && !shot)
    {
        shot = true;
        
        if (!pizzaball)
        {
            with (playerid)
            {
                xscale = other.image_xscale;
                movespeed = 12;
                state = UnknownEnum.Value_5;
                vsp = -14;
                jumpstop = true;
            }
        }
        else
        {
            with (golfid)
            {
                image_xscale = other.image_xscale;
                scr_pizzaball_go_to_thrown(12 * image_xscale, -14, false);
            }
        }
    }
}

if (state == UnknownEnum.Value_138 && stunned > 40 && birdcreated == false)
{
    birdcreated = true;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != UnknownEnum.Value_138)
    birdcreated = false;

if (flash == true && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state != UnknownEnum.Value_4)
    depth = 0;

if (state != UnknownEnum.Value_138)
    thrown = false;

enum UnknownEnum
{
    Value_4 = 4,
    Value_5,
    Value_74 = 74,
    Value_126 = 126,
    Value_128 = 128,
    Value_129,
    Value_130,
    Value_134 = 134,
    Value_136 = 136,
    Value_137,
    Value_138
}
