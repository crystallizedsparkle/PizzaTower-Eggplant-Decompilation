var x1, t, d;

if (room == rm_editor)
    exit;

image_speed = 0.35;

switch (state)
{
    case UnknownEnum.Value_126:
        sprite_index = idlespr;
        playerid = instance_nearest(x, y, obj_player);
        x1 = 370;
        
        if (image_xscale > 0)
            t = playerid.x > (x - 16) && playerid.x < (x + x1) && playerid.y > (y - 16) && playerid.y < (y + 200);
        else
            t = playerid.x < (x + 16) && playerid.x > (x - x1) && playerid.y > (y - 16) && playerid.y < (y + 200);
        
        if (cooldown > 0)
        {
            cooldown--;
        }
        else if (t)
        {
            state = UnknownEnum.Value_8;
            sprite_index = spr_ghoul_attackstart;
            image_index = 0;
            attack_y = y;
        }
        
        break;
    
    case UnknownEnum.Value_128:
        scr_enemy_charge();
        break;
    
    case UnknownEnum.Value_134:
        sprite_index = idlespr;
        d = point_direction(x, y, xstart, ystart);
        x += lengthdir_x(8, d);
        y += lengthdir_y(8, d);
        hsp = 0;
        vsp = 0;
        
        if (x > (xstart - 10) && x < (xstart + 10) && y > (ystart - 10) && y < (ystart + 10))
        {
            state = UnknownEnum.Value_126;
            image_xscale = start_xscale;
            cooldown = 100;
            x = xstart;
            y = ystart;
        }
        else
        {
            image_xscale = sign(x - xstart);
        }
        
        break;
    
    case UnknownEnum.Value_8:
        hsp = 0;
        vsp = 0;
        
        if (floor(image_index) == (image_number - 1))
        {
            state = UnknownEnum.Value_80;
            vsp = 11;
            attack_y = y;
            sprite_index = spr_ghoul_attack;
        }
        
        break;
    
    case UnknownEnum.Value_80:
        vsp = Approach(vsp, -11, 0.5);
        hsp = image_xscale * 10;
        x += hsp;
        y += vsp;
        
        if (y < attack_y && vsp < 0)
        {
            y = attack_y;
            vsp = 0;
            state = UnknownEnum.Value_126;
            cooldown = 100;
            image_xscale *= -1;
        }
        
        break;
    
    case UnknownEnum.Value_130:
        break;
    
    case UnknownEnum.Value_136:
        scr_enemy_land();
        break;
    
    case UnknownEnum.Value_137:
        scr_enemy_hit();
        break;
    
    case UnknownEnum.Value_138:
        scr_enemy_stun();
        hit = true;
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

if (state != UnknownEnum.Value_4)
    depth = 0;

if (state != UnknownEnum.Value_138)
    thrown = false;

if (bombreset > 0)
    bombreset--;

if (grounded && state == UnknownEnum.Value_129 && floor(image_index) == 3)
    vsp = -5;

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
    Value_8 = 8,
    Value_80 = 80,
    Value_126 = 126,
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
