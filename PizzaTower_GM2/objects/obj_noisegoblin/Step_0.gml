if (room == rm_editor)
    exit;

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

if (state == UnknownEnum.Value_138 && stunned > 100 && birdcreated == false)
{
    birdcreated = true;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != UnknownEnum.Value_138)
    birdcreated = false;

scr_scareenemy();

if (flash == true && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state != UnknownEnum.Value_4)
    depth = 0;

if (state != UnknownEnum.Value_138)
    thrown = false;

if (bombreset > 0)
    bombreset--;

targetplayer = global.coop ? instance_nearest(x, y, obj_player) : 324;

if (sprite_index == spr_archergoblin_shoot)
    image_xscale = -sign(x - targetplayer.x);

if (x != targetplayer.x && targetplayer.state != UnknownEnum.Value_51 && state != UnknownEnum.Value_129 && bombreset == 0 && grounded)
{
    if ((targetplayer.x > (x - 200) && targetplayer.x < (x + 200)) && (y <= (targetplayer.y + 200) && y >= (targetplayer.y - 200)))
    {
        if (state == UnknownEnum.Value_134 || state == UnknownEnum.Value_126)
        {
            sprite_index = spr_archergoblin_shoot;
            image_index = 0;
            image_xscale = -sign(x - targetplayer.x);
            state = UnknownEnum.Value_129;
        }
    }
}

if (instance_exists(obj_player2))
{
    if (x != obj_player2.x && obj_player2.state != UnknownEnum.Value_51 && state != UnknownEnum.Value_129 && bombreset == 0 && grounded)
    {
        if ((obj_player2.x > (x - 200) && obj_player2.x < (x + 200)) && (y <= (obj_player2.y + 200) && y >= (obj_player2.y - 200)))
        {
            if (state == UnknownEnum.Value_134 || state == UnknownEnum.Value_126)
            {
                sprite_index = spr_archergoblin_shoot;
                image_index = 0;
                image_xscale = -sign(x - obj_player2.x);
                state = UnknownEnum.Value_129;
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
