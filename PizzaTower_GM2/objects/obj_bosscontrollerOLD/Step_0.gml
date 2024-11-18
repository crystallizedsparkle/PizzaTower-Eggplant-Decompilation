var round_yto, p, lag, hit;

if (!instance_exists(bossID) && bossID != -4 && state != UnknownEnum.Value_98 && !fakedeath)
{
    state = UnknownEnum.Value_98;
    alarm[1] = room_speed * 4;
}

if (player_hp <= 0)
{
    fakedeath = false;
    
    if (state != UnknownEnum.Value_8 && state != UnknownEnum.Value_89)
    {
        if (endroundfunc != -4)
            endroundfunc();
        
        depth = obj_player1.depth + 1;
        state = UnknownEnum.Value_8;
        
        with (bossID)
            player_destroy(lastplayerid);
    }
    else if (bossID.state != UnknownEnum.Value_61 && state != UnknownEnum.Value_89)
    {
        state = UnknownEnum.Value_89;
        alarm[1] = room_speed * 4;
    }
}

if (instance_exists(bossID))
{
    if (bossID.destroyed && !fakedeath)
    {
        depth = bossID.depth + 1;
        state = UnknownEnum.Value_8;
    }
}

switch (state)
{
    case UnknownEnum.Value_144:
        with (obj_player)
        {
            state = UnknownEnum.Value_146;
            xscale = (x > (room_width / 2)) ? -1 : 1;
            image_blend = make_colour_hsv(0, 0, 255);
        }
        
        with (par_boss)
        {
            state = UnknownEnum.Value_146;
            x = xstart;
        }
        
        if (playerx != 0)
        {
            playerx += 5;
        }
        else if (!flashed)
        {
            flash = true;
            flashed = true;
            alarm[2] = 0.15 * room_speed;
        }
        
        if (bossx != (room_width - sprite_get_width(bossspr)))
            bossx -= 5;
        
        if (vsy != 0)
            vsy += 5;
        
        flamey -= 4;
        
        if (intro_buffer > 0)
        {
            intro_buffer--;
        }
        else if (use_countdown)
        {
            state = UnknownEnum.Value_145;
        }
        else
        {
            state = UnknownEnum.Value_0;
            
            with (obj_player)
            {
                if (object_index != obj_player2 || global.coop)
                    state = UnknownEnum.Value_0;
            }
            
            with (par_boss)
                state = UnknownEnum.Value_0;
        }
        
        break;
    
    case UnknownEnum.Value_145:
        round_yto = 437;
        round_y = Approach(round_y, round_yto, 7);
        
        if (round_y != round_yto)
            round_x = round_xstart + irandom_range(-1, 1);
        
        if (timer_buffer > 0)
        {
            if (bell_buffer > 0)
            {
                if (bell_index > (sprite_get_number(bell_sprite) - 1))
                    bell_index = sprite_get_number(bell_sprite) - 1;
                
                bell_buffer--;
            }
            else
            {
                bell_sprite = 2081;
                round_timer = Approach(round_timer, round_timermax, 60);
            }
            
            timer_buffer--;
            instance_destroy(obj_noisebossbomb);
            
            with (obj_player)
            {
                if (state != UnknownEnum.Value_146 && state != UnknownEnum.Value_95 && state != UnknownEnum.Value_137 && !instance_exists(obj_fadeout))
                {
                    if (state == UnknownEnum.Value_137 || state == UnknownEnum.Value_61)
                    {
                        hitLag = 0;
                        x = hitX;
                        y = hitY;
                    }
                    
                    movespeed = 0;
                    hsp = 0;
                    vsp = 0;
                    sprite_index = spr_idle;
                    image_speed = 0.35;
                    xscale = (x > (room_width / 2)) ? -1 : 1;
                    image_blend = make_colour_hsv(0, 0, 255);
                    state = UnknownEnum.Value_146;
                    visible = true;
                    image_alpha = 1;
                }
                
                if (state == UnknownEnum.Value_146)
                    state_player_arenaround();
            }
            
            with (par_boss)
            {
                if (state == UnknownEnum.Value_137 || state == UnknownEnum.Value_61)
                {
                    hitLag = 0;
                    x = hitX;
                    y = hitY;
                }
                
                if (colliding && state != UnknownEnum.Value_180 && state != UnknownEnum.Value_181)
                {
                    state = UnknownEnum.Value_145;
                    attack_cooldown = attack_max[phase - 1];
                }
            }
        }
        else
        {
            if (startroundfunc != -4)
                startroundfunc();
            
            minutes = maxminutes;
            seconds = maxseconds;
            round_timer = round_timermax;
            bell_sprite = 2081;
            alarm[0] = 1;
            state = UnknownEnum.Value_0;
            
            with (obj_player)
            {
                if (object_index == obj_player1 || global.coop)
                    state = UnknownEnum.Value_0;
            }
            
            with (par_boss)
                state = UnknownEnum.Value_0;
        }
        
        break;
    
    case UnknownEnum.Value_0:
        bell_sprite = 2081;
        round_y = Approach(round_y, round_ystart, 4);
        
        if (super >= supermax && obj_player.state != UnknownEnum.Value_252)
        {
            p = false;
            
            with (obj_player)
            {
                if (!p && key_shoot2 && check_player_coop())
                {
                    other.super = 0;
                    p = true;
                    state = UnknownEnum.Value_252;
                    superattackstate = UnknownEnum.Value_8;
                    lag = 60;
                    hitX = x;
                    hitY = y;
                    hitLag = lag;
                    bossID = other.bossID;
                    other.super_portrait_state = 1;
                    
                    with (instance_create(x, y, obj_finishereffect))
                        playerid = other.id;
                    
                    with (bossID)
                    {
                        hitX = x;
                        hitY = y;
                        hitLag = lag;
                        state = UnknownEnum.Value_252;
                        sprite_index = stunfallspr;
                    }
                }
            }
        }
        
        bg_super_y -= 20;
        
        if (bg_super_y < -540)
            bg_super_y = 0;
        
        switch (super_portrait_state)
        {
            case 0:
                super_portrait_index = 0;
                super_portrait_x = super_portrait_x_off;
                break;
            
            case 1:
                super_portrait_index += 0.35;
                super_portrait_x = Approach(super_portrait_x, super_portrait_xstart, 40);
                
                if (super_portrait_x == super_portrait_xstart)
                    super_portrait_state = 2;
                
                break;
            
            case 2:
                super_portrait_index += 0.35;
                super_portrait_x += 1;
                
                if (obj_player.state != UnknownEnum.Value_252 || obj_player.superattackstate != UnknownEnum.Value_8)
                    super_portrait_state = 0;
                
                break;
        }
        
        break;
    
    case UnknownEnum.Value_8:
        instance_destroy(obj_baddiespawner);
        instance_destroy(obj_baddie);
        
        if (player_hp > 0)
        {
            if (!instance_exists(bossID) || bossID.state != UnknownEnum.Value_137)
            {
                fade -= 0.05;
                fade = clamp(fade, 0, 1);
            }
        }
        else
        {
            hit = false;
            
            with (obj_player)
            {
                if (state == UnknownEnum.Value_137)
                    hit = true;
            }
            
            if (!hit)
            {
                fade -= 0.05;
                fade = clamp(fade, 0, 1);
            }
        }
        
        break;
    
    case UnknownEnum.Value_98:
    case UnknownEnum.Value_89:
        fade -= 0.05;
        fade = clamp(fade, 0, 1);
        break;
}

bell_index += 0.35;
portrait1_index += 0.35;
portrait2_index += 0.35;

if (state == UnknownEnum.Value_0 && instance_exists(bossID))
{
    if (obj_player1.state == UnknownEnum.Value_137 || obj_player1.state == UnknownEnum.Value_156)
        portrait1_sprite = portrait1_hurt;
    else
        portrait1_sprite = portrait1_idle;
    
    if (bossID.state == UnknownEnum.Value_137 || bossID.state == UnknownEnum.Value_138)
        portrait2_sprite = portrait2_hurt;
    else
        portrait2_sprite = portrait2_idle;
}
else
{
    portrait1_sprite = portrait1_idle;
    portrait2_sprite = portrait2_idle;
}

enum UnknownEnum
{
    Value_0,
    Value_8 = 8,
    Value_61 = 61,
    Value_89 = 89,
    Value_95 = 95,
    Value_98 = 98,
    Value_137 = 137,
    Value_138,
    Value_144 = 144,
    Value_145,
    Value_146,
    Value_156 = 156,
    Value_180 = 180,
    Value_181,
    Value_252 = 252
}
