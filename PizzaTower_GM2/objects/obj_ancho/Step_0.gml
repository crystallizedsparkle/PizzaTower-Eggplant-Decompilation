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
    
    case UnknownEnum.Value_154:
        scr_enemy_pummel();
        break;
    
    case UnknownEnum.Value_155:
        scr_enemy_staggered();
        break;
    
    case UnknownEnum.Value_125:
        scr_enemy_rage();
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

if (flash == true && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state != UnknownEnum.Value_4)
    depth = 0;

if (state != UnknownEnum.Value_128)
    scr_scareenemy();

if (sprite_index == spr_ancho_chargestart && floor(image_index) == (image_number - 1))
{
    if (hitboxcreate == false && state == UnknownEnum.Value_128)
    {
        hitboxcreate = true;
        
        with (instance_create(x, y, obj_forkhitbox))
            ID = other.id;
    }
    
    sprite_index = spr_ancho_charge;
    movespeed = 10;
}

player = instance_nearest(x, y, obj_player);

if (ragebuffer > 0)
    ragebuffer--;

if ((player.x > (x - 400) && player.x < (x + 400)) && (y <= (player.y + 60) && y >= (player.y - 60)) && important == false)
{
    if (state != UnknownEnum.Value_125 && ragebuffer == 0 && elite && (state == UnknownEnum.Value_134 || state == UnknownEnum.Value_128))
    {
        state = UnknownEnum.Value_125;
        sprite_index = spr_ancho_rage1;
        
        if (x != player.x)
            image_xscale = -sign(x - player.x);
        
        ragebuffer = 100;
        image_index = 0;
        image_speed = 0.5;
        flash = true;
        alarm[4] = 5;
        
        with (instance_create(x, y, obj_forkhitbox))
        {
            sprite_index = spr_bighitbox;
            mask_index = spr_bighitbox;
            ID = other.id;
        }
        
        create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
    }
    else if (x != player.x && state != UnknownEnum.Value_128 && y == ystart && important == false)
    {
        if (state == UnknownEnum.Value_134)
        {
            image_index = 0;
            image_xscale = -sign(x - obj_player.x);
            state = UnknownEnum.Value_128;
            sprite_index = spr_ancho_chargestart;
        }
    }
}

if (state == UnknownEnum.Value_138 || state == UnknownEnum.Value_134)
    movespeed = 0;

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
    Value_138,
    Value_154 = 154,
    Value_155
}
