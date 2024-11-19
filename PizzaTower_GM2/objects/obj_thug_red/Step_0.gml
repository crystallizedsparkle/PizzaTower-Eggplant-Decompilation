var targetplayer, inst_front, inst_up, inst_down, inst_down2, num, i, player;

if (room == rm_editor)
    exit;

targetplayer = global.coop ? instance_nearest(x, y, obj_player) : 324;

if (bombreset > 0)
    bombreset--;

if (state == states.walk)
{
    if (!chasing)
    {
        sprite_index = idlespr;
        
        if (collision_line(x, y, targetplayer.x, targetplayer.y, obj_solid, false, true) == -4 && ((image_xscale < 0 && targetplayer.x < x) || (image_xscale > 0 && targetplayer.x > x)) && (targetplayer.y < (y + threshold_y) && targetplayer.y > (y - threshold_y)))
            targetplayer = instance_nearest(x, y, obj_player);
        
        if ((targetplayer.x > (x - 150) && targetplayer.x < (x + 150)) && (y <= (targetplayer.y + 60) && y >= (targetplayer.y - 60)))
        {
            chasing = true;
            state = states.charge;
            attack_count = attack_max;
            
            if (x != targetplayer.x)
                image_xscale = -sign(x - targetplayer.x);
            
            sprite_index = walkspr;
            image_index = 0;
            bombreset = attackreset;
        }
    }
    else
    {
        state = states.chase;
        sprite_index = walkspr;
        image_index = 0;
    }
}
else if (state == states.chase)
{
    if (sprite_index == spr_shrimp_throw)
        sprite_index = spr_shrimp_walk;
    
    if (abs(x - targetplayer.x) < 64)
    {
        if (grounded && vsp > -1)
            hsp = 0;
        else if (!grounded)
            hsp = image_xscale * chasespeed;
    }
    else if (grounded)
    {
        if (x != targetplayer.x && grounded)
            image_xscale = -sign(x - targetplayer.x);
        
        hsp = image_xscale * chasespeed;
    }
    
    if (bombreset <= 0 && grounded)
    {
        if ((targetplayer.x > (x - attackthreshold_x) && targetplayer.x < (x + attackthreshold_x)) && (targetplayer.y > (y - attackthreshold_y) && targetplayer.y < (y + attackthreshold_y)))
        {
            state = states.charge;
            hsp = 0;
            attack_count = attack_max;
        }
    }
    
    inst_front = collision_line(x, y + 25, x + (sign(hsp) * 78), y + 25, obj_solid, false, true);
    inst_up = collision_line(x + (sign(hsp) * 96), y + 25, x + (sign(hsp) * 96), (y - 78) + 50, obj_platform, false, true);
    inst_down = collision_line(x + (sign(hsp) * 16), y, x + (sign(hsp) * 16), y + 64, obj_solid, false, true);
    inst_down2 = collision_line(x + (sign(hsp) * 16), y, x + (sign(hsp) * 16), y + 64, obj_platform, false, true);
    
    if (image_index > (image_number - 1))
    {
        if (sprite_index == spr_shrimp_jump)
        {
            sprite_index = spr_shrimp_fall;
            image_index = 0;
        }
        else if (sprite_index == spr_shrimp_land)
        {
            sprite_index = spr_shrimp_walk;
            image_index = 0;
        }
    }
    
    if (grounded && sprite_index == spr_shrimp_fall)
    {
        sprite_index = spr_shrimp_land;
        image_index = 0;
    }
    
    if (((inst_front != -4 || inst_up != -4) || (inst_down == -4 && inst_down2 == -4)) && targetplayer.y <= (y + 32) && grounded && state != states.charge)
    {
        vsp = -11;
        sprite_index = spr_shrimp_jump;
        image_index = 0;
        hsp = image_xscale * chasespeed;
    }
}

if (state == states.charge)
{
    bombreset = attackreset;
    
    if (attack_count > 0)
    {
        if (sprite_index != spr_shrimp_punch)
        {
            sprite_index = spr_shrimp_punch;
            image_index = 0;
        }
        
        attack_count--;
    }
    else
    {
        state = states.punch;
        attackspeed = attackspeed_max;
        hsp = image_xscale * attackspeed;
    }
}

if (state == states.punch)
{
    if (!instance_exists(punchinst))
    {
        punchinst = instance_create(x, y, obj_forkhitbox);
        
        with (punchinst)
            ID = other.id;
    }
    
    if (alarm[4] == -1)
        alarm[4] = 7;
    
    hsp = image_xscale * attackspeed;
    
    if (attackspeed > 0)
        attackspeed -= deccel;
    else
        attackspeed = 0;
    
    if (attackspeed == 0)
    {
        bombreset = attackreset;
        state = states.walk;
        sprite_index = walkspr;
        image_index = 0;
    }
    
    if (place_meeting(x + sign(hsp), y, obj_destructibles))
    {
        num = instance_place_list(x + sign(hsp), y, 332, global.instancelist, false);
        
        for (i = 0; i < num; i++)
            instance_destroy(ds_list_find_value(global.instancelist, i));
        
        ds_list_clear(global.instancelist);
    }
}
else if (flash && alarm[4] == -1)
{
    alarm[4] = 7;
}

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
        chasing = true;
        scr_enemy_stun();
        break;
    
    case states.enemy_throw:
        scr_pizzagoblin_throw();
        break;
    
    case states.grabbed:
        chasing = true;
        scr_enemy_grabbed();
        break;
    
    case states.rage:
        scr_enemy_rage();
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

if (elite && ragecooldown <= 0)
{
    player = instance_nearest(x, y, obj_player);
    
    if (state == states.walk || state == states.charge)
    {
        if ((player.x > (x - 400) && player.x < (x + 400)) && (y <= (player.y + 60) && y >= (player.y - 60)))
        {
            image_xscale = -sign(x - player.x);
            sprite_index = spr_shrimp_knife;
            image_index = 0;
            flash = true;
            shot = false;
            alarm[4] = 5;
            state = states.rage;
            create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
            ragecooldown = 100;
        }
    }
}

if (ragecooldown > 0)
    ragecooldown--;

scr_scareenemy();

if (sprite_index == scaredspr && state == states.idle)
    invincible = false;

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
    Value_141 = 141
}
