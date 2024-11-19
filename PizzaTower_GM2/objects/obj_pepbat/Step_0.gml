var targetplayer, dir;

if (room == rm_editor)
    exit;

targetplayer = instance_nearest(x, y, obj_player);

switch (state)
{
    case states.idle:
        if (sprite_index != scaredspr)
        {
            sprite_index = spr_pepbat_idle;
            
            if (targetplayer.x > (x - 150) && targetplayer.x < (x + 150) && targetplayer.y > y && targetplayer.y < (y + 200))
            {
                state = states.walk;
                hit = false;
            }
        }
        else
        {
            hsp = 0;
            vsp = 0;
            
            if (scaredbuffer > 0)
                scaredbuffer--;
            else
                sprite_index = spr_pepbat_idle;
        }
        
        break;
    
    case states.charge:
        scr_enemy_charge();
        break;
    
    case states.turn:
        sprite_index = spr_pepbat_move;
        dir = point_direction(x, y, xstart, ystart);
        x = Approach(x, xstart, abs(lengthdir_x(5, dir)));
        y = Approach(y, ystart, abs(lengthdir_y(5, dir)));
        
        if (xstart != x)
            image_xscale = sign(xstart - x);
        
        if (x > (xstart - 10) && x < (xstart + 10) && y > (ystart - 10) && y < (ystart + 10))
        {
            x = xstart;
            y = ystart;
            state = states.idle;
        }
        
        break;
    
    case states.walk:
        vsp = 0;
        hsp = 0;
        sprite_index = spr_pepbat_move;
        
        if (targetplayer.x != x)
            image_xscale = sign(targetplayer.x - x);
        
        if (!((targetplayer.x > (x - 70) && targetplayer.x < (x + 70)) && (y <= (targetplayer.y + 29) && y >= (targetplayer.y - 29))))
        {
            dir = point_direction(x, y, targetplayer.x, targetplayer.y);
            x += lengthdir_x(3, dir);
            y += lengthdir_y(3, dir);
        }
        
        if (hit || distance_to_point(xstart, ystart) > 800)
        {
            hit = false;
            state = states.turn;
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
        hit = true;
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

scr_scareenemy();

if (bombreset > 0)
    bombreset--;

targetplayer = global.coop ? instance_nearest(x, y, obj_player) : 324;

if (x != targetplayer.x && state == states.walk && state != states.enemy_throw && obj_player.state != states.tumble && bombreset <= 0 && grounded)
{
    if ((targetplayer.x > (x - 80) && targetplayer.x < (x + 80)) && (y <= (targetplayer.y + 30) && y >= (targetplayer.y - 30)))
    {
        if (state == states.walk)
        {
            image_index = 0;
            sprite_index = spr_pepbat_kick;
            image_xscale = -sign(x - targetplayer.x);
            state = states.enemy_throw;
        }
    }
}

if (grounded && state == states.enemy_throw && floor(image_index) == 3)
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
    Value_5,
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
