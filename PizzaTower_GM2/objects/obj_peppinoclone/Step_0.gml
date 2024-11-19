var inst_front, inst_down, inst_down2, inst_up;

if (room == rm_editor)
    exit;

targetplayer = instance_nearest(x, y, obj_player);

switch (state)
{
    case states.idle:
        scr_enemy_idle();
        break;
    
    case states.turn:
        scr_enemy_turn();
        break;
    
    case states.walk:
        if (targetplayer.x > (x - 700) && targetplayer.x < (x + 700) && targetplayer.y < (y + 500) && targetplayer.y > (y - 500))
        {
            if (grounded && x != targetplayer.x)
                image_xscale = sign(targetplayer.x - x);
            
            if (cooldown > 0)
                cooldown--;
            
            if (targetplayer.x > (x - 100) && targetplayer.x < (x + 100) && grounded)
            {
                hsp = Approach(hsp, 0, 0.5);
                
                if (cooldown <= 0)
                {
                    state = states.punch;
                    sprite_index = spr_pepclone_attack;
                    image_index = 0;
                    shot = false;
                }
            }
            else
            {
                hsp = image_xscale * 6;
            }
            
            if (state != states.punch)
            {
                if (grounded)
                {
                    if (hsp != 0)
                        sprite_index = walkspr;
                    else
                        sprite_index = idlespr;
                }
                else if (sprite_index != spr_player_jump && sprite_index != spr_player_fall)
                {
                    sprite_index = spr_player_fall;
                }
                else if (sprite_index == spr_player_jump && floor(image_index) == (image_number - 1))
                {
                    sprite_index = spr_player_fall;
                }
                
                inst_front = collision_line(x, y + 25, x + (sign(hsp) * 78), y + 25, obj_solid, false, true);
                inst_down = collision_line(x + (sign(hsp) * 16), y, x + (sign(hsp) * 16), y + 64, obj_solid, false, true);
                inst_down2 = collision_line(x + (sign(hsp) * 16), y, x + (sign(hsp) * 16), y + 64, obj_platform, false, true);
                inst_up = collision_line(x + (sign(hsp) * 96), y + 25, x + (sign(hsp) * 96), (y - 78) + 50, obj_platform, false, true);
                
                if (((!place_meeting(x, y + 1, obj_slope) && (inst_front != -4 || inst_up != -4)) || (inst_down == -4 && inst_down2 == -4)) && targetplayer.y <= (y + 32) && grounded && state != states.charge)
                {
                    vsp = -11;
                    sprite_index = spr_player_jump;
                    image_index = 0;
                }
            }
        }
        
        break;
    
    case states.punch:
        hsp = Approach(hsp, 0, 1);
        
        if (!shot && floor(image_index) > 14)
        {
            shot = true;
            hitboxID = instance_create(x, y, obj_forkhitbox);
            
            with (hitboxID)
            {
                ID = other.id;
                sprite_index = spr_weeniesquire_hitbox;
            }
        }
        
        if (floor(image_index) > 23)
            instance_destroy(hitboxID);
        
        if (floor(image_index) == (image_number - 1))
        {
            state = states.walk;
            instance_destroy(hitboxID);
            cooldown = 100;
        }
        
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
    Value_80 = 80,
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
