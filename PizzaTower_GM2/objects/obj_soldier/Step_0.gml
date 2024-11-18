var player, col, col2, colX, colY;

if (room == rm_editor)
    exit;

switch (state)
{
    case UnknownEnum.Value_126:
        if (sprite_index != spr_soldier_idleend)
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

if (flash == true && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

player = instance_nearest(x, y, obj_player);

switch (state)
{
    case UnknownEnum.Value_126:
        if (bush)
        {
            col = collision_line(x, y, player.x, player.y, obj_solid, false, true);
            col2 = collision_line(x, y, player.x, player.y, obj_slope, false, true);
            colX = player.x > (x - threshold_x) && player.x < (x + threshold_x);
            colY = player.y > (y - threshold_y) && player.y < (y + threshold_y);
            
            if (sprite_index != scaredspr && col == -4 && col2 == -4 && colX && colY)
            {
                if (x != player.x)
                    image_xscale = sign(player.x - x);
                
                bush = false;
                sprite_index = spr_soldier_idleend;
                image_index = 0;
            }
        }
        else if (sprite_index == spr_soldier_idleend && floor(image_index) == (image_number - 1))
        {
            state = UnknownEnum.Value_134;
            sprite_index = spr_soldier_walk;
        }
        
        break;
    
    case UnknownEnum.Value_128:
        hsp = Approach(hsp, 0, 0.5);
        
        if (sprite_index == spr_soldier_shootstart && floor(image_index) == (image_number - 1))
            sprite_index = spr_soldier_shoot;
        
        if (sprite_index != spr_soldier_shootstart)
        {
            if (bullet_count > 0)
            {
                if (can_fire)
                {
                    can_fire = false;
                    alarm[5] = fire_max;
                    bullet_count--;
                    sprite_index = spr_soldier_shoot;
                    image_index = 0;
                    hsp -= (image_xscale * recoil_spd);
                    
                    with (instance_create(x, y, obj_enemybullet))
                        image_xscale = other.image_xscale;
                }
            }
            else if (floor(image_index) == (image_number - 1))
            {
                sprite_index = walkspr;
                attack_cooldown = attack_max;
                state = UnknownEnum.Value_134;
            }
        }
        
        break;
    
    case UnknownEnum.Value_134:
        if (attack_cooldown > 0)
        {
            attack_cooldown--;
        }
        else
        {
            col = collision_line(x, y, player.x, player.y, obj_solid, false, true);
            col2 = collision_line(x, y, player.x, player.y, obj_slope, false, true);
            colX = player.x > (x - threshold_x) && player.x < (x + threshold_x);
            colY = player.y > (y - threshold_y) && player.y < (y + threshold_y);
            
            if (sprite_index != scaredspr && col == -4 && col2 == -4 && colX && colY)
            {
                if (x != player.x)
                    image_xscale = sign(player.x - x);
                
                sprite_index = spr_soldier_shootstart;
                image_index = 0;
                state = UnknownEnum.Value_128;
                bullet_count = bullet_max;
                can_fire = true;
            }
        }
        
        break;
}

if (elite)
{
    if (state == UnknownEnum.Value_134)
    {
        if ((player.x > (x - 200) && player.x < (x + 200)) && (y <= (player.y + 60) && y >= (player.y - 60)))
        {
            if (state != UnknownEnum.Value_125 && ragebuffer == 0)
            {
                hitboxcreate = false;
                state = UnknownEnum.Value_125;
                sprite_index = spr_soldier_knife;
                
                if (x != player.x)
                    image_xscale = -sign(x - player.x);
                
                ragebuffer = 100;
                image_index = 0;
                image_speed = 0.5;
                flash = true;
                alarm[4] = 5;
                create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
            }
        }
    }
    
    if (ragebuffer > 0)
        ragebuffer--;
}

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
