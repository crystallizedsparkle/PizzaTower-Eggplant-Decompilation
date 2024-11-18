var player, targetplayer;

player = instance_nearest(x, y, obj_player);

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
    
    case UnknownEnum.Value_141:
        scr_enemy_chase();
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
    
    case UnknownEnum.Value_80:
        if (sprite_index == spr_minijohn_punchstart)
        {
            image_speed = 0.35;
            hsp = Approach(hsp, 0, 1);
            
            if (floor(image_index) == (image_number - 1))
            {
                punchspd = 8;
                hsp = punchspd * image_xscale;
                sprite_index = spr_minijohn_punch;
                image_index = 0;
                image_speed = 0.25;
                
                with (instance_create(x, y, obj_forkhitbox))
                {
                    sprite_index = spr_bighitbox;
                    mask_index = spr_bighitbox;
                    ID = other.id;
                }
            }
        }
        else if (sprite_index == spr_minijohn_punch)
        {
            image_speed = 0.25;
            punchspd = Approach(punchspd, 0, 0.25);
            hsp = punchspd * image_xscale;
            
            with (instance_place(x + hsp, y, obj_destructibles))
                instance_destroy();
            
            if (floor(image_index) == (image_number - 1))
            {
                state = UnknownEnum.Value_141;
                ragecooldown = 100;
                sprite_index = spr_minijohn_charge;
            }
        }
        
        break;
    
    case UnknownEnum.Value_189:
        hsp = 0;
        
        if (underground)
        {
            if (vsp < 0)
                vsp = 0;
            
            sprite_index = spr_minijohn_underground;
            
            if (player.x > (x - 200) && player.x < (x + 200) && y <= (player.y + 60) && y >= (player.y - 60))
            {
                sprite_index = spr_minijohn_undergroundout;
                image_index = 0;
                underground = false;
                
                if (player.x != x)
                    image_xscale = sign(x - player.x);
            }
        }
        else if (sprite_index == spr_minijohn_undergroundout)
        {
            if (vsp < 0)
                vsp = 0;
            
            if (floor(image_index) == (image_number - 1))
            {
                sprite_index = spr_minijohn_stun;
                vsp = -4;
                
                repeat (3)
                    create_debris(x, y, 1123);
            }
        }
        else if (grounded)
        {
            state = UnknownEnum.Value_141;
            sprite_index = spr_minijohn_charge;
        }
        
        break;
}

if (state == UnknownEnum.Value_138 && stunned > 100 && birdcreated == false)
{
    birdcreated = true;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state == UnknownEnum.Value_141 && ragecooldown <= 0)
{
    if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60))
    {
        if (x != player.x)
            image_xscale = sign(player.x - x);
        
        if (elite)
        {
            sprite_index = spr_minijohn_rage1;
            image_index = 0;
            vsp = -8;
            flash = true;
            alarm[4] = 5;
            ragecooldown = 100;
            state = UnknownEnum.Value_125;
            create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
            
            with (instance_create(x, y, obj_forkhitbox))
            {
                sprite_index = spr_bighitbox;
                mask_index = spr_bighitbox;
                ID = other.id;
            }
        }
        else
        {
            sprite_index = spr_minijohn_punchstart;
            image_index = 0;
            ragecooldown = 100;
            state = UnknownEnum.Value_80;
        }
    }
}

if (ragecooldown > 0)
    ragecooldown--;

if (state != UnknownEnum.Value_138)
    birdcreated = false;

if (flash == true && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state != UnknownEnum.Value_141)
    momentum = 0;

if (state == UnknownEnum.Value_134 || state == UnknownEnum.Value_126)
{
    targetplayer = 324;
    
    if (obj_player1.spotlight == false)
        targetplayer = 323;
    
    movespeed = 4;
    
    if (targetplayer.x != x)
        image_xscale = -sign(x - targetplayer.x);
    
    state = UnknownEnum.Value_141;
}

if (instance_exists(obj_player2))
{
    if ((obj_player2.x > (x - 400) && obj_player2.x < (x + 400)) && (y <= (obj_player2.y + 60) && y >= (obj_player2.y - 60)))
    {
        if (state != UnknownEnum.Value_126 && obj_player2.state == UnknownEnum.Value_121)
        {
            state = UnknownEnum.Value_126;
            sprite_index = scaredspr;
            
            if (x != obj_player2.x)
                image_xscale = -sign(x - obj_player2.x);
        }
    }
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

if (state == UnknownEnum.Value_189)
{
    invincible = true;
    
    if (sprite_index != spr_minijohn_underground && sprite_index != spr_minijohn_undergroundout)
        image_blend = c_gray;
}
else
{
    invincible = false;
    image_blend = c_white;
}

enum UnknownEnum
{
    Value_4 = 4,
    Value_80 = 80,
    Value_121 = 121,
    Value_125 = 125,
    Value_126,
    Value_129 = 129,
    Value_130,
    Value_134 = 134,
    Value_136 = 136,
    Value_137,
    Value_138,
    Value_141 = 141,
    Value_154 = 154,
    Value_155,
    Value_189 = 189
}
