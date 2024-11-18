var player;

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

if (state == UnknownEnum.Value_134 && y > ystart && !scr_solid(x, y - 1))
    y--;

if (state == UnknownEnum.Value_134 && y < ystart && !scr_solid(x, y + 1))
    y++;

if (state == UnknownEnum.Value_138)
    grav = 0.5;
else
    grav = 0;

if (bombreset > 0 && state == UnknownEnum.Value_134)
    bombreset--;

player = instance_nearest(x, y, obj_player);

if (ragebuffer > 0)
    ragebuffer--;

if ((player.x > (x - 200) && player.x < (x + 200)) && (player.y <= (y + 400) && player.y >= (y - 60)))
{
    if (x != player.x && state != UnknownEnum.Value_129 && bombreset == 0)
    {
        if (state == UnknownEnum.Value_134 || state == UnknownEnum.Value_126)
        {
            sprite_index = spr_kentukybomber_attack;
            image_index = 0;
            state = UnknownEnum.Value_129;
        }
    }
}

if (flash == true && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state == UnknownEnum.Value_129 || state == UnknownEnum.Value_125)
{
    hsp = 0;
    vsp = 0;
}

if (state != UnknownEnum.Value_4)
    depth = 0;

scr_scareenemy();

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
