function vigilante_cancel_attack()
{
    if (cancel_buffer > 0)
    {
        cancel_buffer--;
    }
    else if (combo_count > 0)
    {
        targetstunned = 0;
        state = argument[irandom(argument_count - 1)];
        combo_count--;
        cancel_buffer = ds_map_find_value(cancel_max, state);
        
        if (is_undefined(cancel_buffer))
            cancel_buffer = cancel_maxdefault;
        
        switch (state)
        {
            case UnknownEnum.Value_1:
                revolver_count = choose(1, 2);
                movespeed = 0;
                sprite_index = spr_playerV_revolverstart;
                image_index = 0;
                break;
            
            case UnknownEnum.Value_82:
                normalattack_cooldown = normalattack_max[phase - 1];
                vsp = -14;
                movespeed = 2;
                sprite_index = spr_playerV_superjump;
                image_xscale = (targetplayer.x != x) ? sign(targetplayer.x - x) : image_xscale;
                image_index = 0;
                instance_create(x, y, obj_highjumpcloud2);
                break;
            
            case UnknownEnum.Value_42:
                normalattack_cooldown = normalattack_max[phase - 1];
                movespeed = 8;
                vsp = grounded ? 0 : -4;
                sprite_index = spr_playerV_mach3boost;
                image_index = 0;
                
                with (instance_create(x, y, obj_superdashcloud))
                    image_xscale = other.image_xscale;
                
                with (instance_create(x, y, obj_crazyrunothereffect))
                    image_xscale = other.image_xscale;
                
                break;
            
            case UnknownEnum.Value_128:
                sprite_index = spr_playerV_divekickstart;
                image_index = 0;
                movespeed = 0;
                break;
            
            case UnknownEnum.Value_164:
                vsp = -14;
                image_xscale = (targetplayer.x != x) ? sign(targetplayer.x - x) : ((x < (room_width / 2)) ? 1 : -1);
                sprite_index = spr_playerV_jump;
                image_index = 0;
                movespeed = 0;
                instance_create(x, y, obj_highjumpcloud2);
                break;
            
            case UnknownEnum.Value_166:
                sprite_index = spr_playerV_crazyrun;
                image_xscale = (targetplayer.x != x) ? sign(targetplayer.x - x) : ((x < (room_width / 2)) ? 1 : -1);
                image_index = 0;
                movespeed = 4;
                millionpunch_buffer = millionpunch_max;
                
                with (instance_create(x, y, obj_millionpunchhitbox))
                    baddieID = other.id;
                
                break;
            
            case UnknownEnum.Value_2:
                dynamite_shot = true;
                sprite_index = spr_playerV_dynamitethrow;
                image_index = 0;
                
                with (instance_create(x, y, obj_dynamite))
                {
                    obj_explosion = 85;
                    image_xscale = other.image_xscale;
                    movespeed = 6;
                    vsp = -6;
                }
                
                break;
        }
    }
}

function boss_vigilante_decide_attack()
{
    if (phase < 3)
    {
        vigilante_decide_attack_phase1();
    }
    else if (phase == 3)
    {
        vigilante_decide_attack_phase3();
    }
    else if (phase == 4)
    {
        vigilante_decide_attack_phase4();
    }
    else if (phase == 5)
    {
        if (honor)
            vigilante_decide_attack_phase4();
        else
            vigilante_decide_attack_phase5();
        
        cancel_buffer = ds_map_find_value(cancel_max, state);
        
        if (is_undefined(cancel_buffer))
            cancel_buffer = cancel_maxdefault;
        
        combo_count = irandom(1);
    }
    else if (phase == 6)
    {
        if (honor)
            vigilante_decide_attack_phase4();
        else
            vigilante_decide_attack_phase6_nohonor();
        
        cancel_buffer = ds_map_find_value(cancel_max, state);
        
        if (is_undefined(cancel_buffer))
            cancel_buffer = cancel_maxdefault;
        
        combo_count = irandom(2);
        
        if (important && (hp < duelhp_threshold || obj_bosscontroller.seconds < duelseconds_threshold))
        {
            if (hitstate != UnknownEnum.Value_160)
            {
                state = UnknownEnum.Value_158;
                duelintro_buffer = duelintro_max;
                movespeed = 0;
                
                with (obj_bosshitbox)
                    instance_destroy();
                
                with (obj_player)
                {
                    if (object_index == obj_player1 || global.coop)
                    {
                        state = UnknownEnum.Value_158;
                        movespeed = 0;
                    }
                }
                
                with (obj_tv)
                {
                    message = "DUEL!!!";
                    alarm[0] = 200;
                    showtext = true;
                }
            }
            else if (grounded)
            {
                sprite_index = idlespr;
                state = UnknownEnum.Value_158;
            }
        }
    }
}

function vigilante_decide_attack_phase6_nohonor()
{
    var attack_chance;
    
    if (attack_cooldown > 0)
    {
        attack_cooldown--;
    }
    else
    {
        attack_chance = irandom(200);
        
        if (attack_chance >= 150)
        {
            vigilante_decide_attack_phase4();
        }
        else if (attack_chance >= 100 && attack_chance < 150)
        {
            vigilante_decide_attack_phase3();
        }
        else if (attack_chance >= 50 && attack_chance < 100)
        {
            vigilante_decide_attack_phase1();
            dynamite_shot = false;
        }
        else
        {
            vigilante_decide_attack_phase1();
            revolver_count = 1;
            revolver_jump = -1;
            dynamite_shot = false;
            superkickattackpursuit = false;
            superkickattack_jump = false;
            dynamite_count = 1;
        }
        
        attack_cooldown = attack_max[phase - 1];
    }
}

function vigilante_decide_attack_phase5()
{
    var attack_chance;
    
    if (attack_cooldown > 0)
    {
        attack_cooldown--;
    }
    else
    {
        attack_chance = irandom(100);
        
        if (attack_chance > 50)
            vigilante_decide_attack_phase4();
        else
            vigilante_decide_attack_phase3();
        
        attack_cooldown = attack_max[phase - 1];
    }
}

function vigilante_decide_attack_phase4()
{
    var att_max;
    
    if (attack_cooldown > 0)
    {
        attack_cooldown--;
    }
    else
    {
        targetstunned = 0;
        att_max = attack_max[phase - 1];
        attack_cooldown = att_max + irandom_range(-att_max, att_max + 20);
        attack_cooldown = (phase > 4) ? attack_max[phase - 1] : attack_cooldown;
        state = choose(UnknownEnum.Value_164, UnknownEnum.Value_128, UnknownEnum.Value_166);
        
        if (state == UnknownEnum.Value_128)
        {
            sprite_index = spr_playerV_divekickstart;
            image_index = 0;
            movespeed = 0;
        }
        else if (state == UnknownEnum.Value_164)
        {
            vsp = -14;
            image_xscale = (targetplayer.x != x) ? sign(targetplayer.x - x) : ((x < (room_width / 2)) ? 1 : -1);
            sprite_index = spr_playerV_jump;
            image_index = 0;
            movespeed = 0;
            instance_create(x, y, obj_highjumpcloud2);
        }
        else if (state == UnknownEnum.Value_166)
        {
            sprite_index = spr_playerV_crazyrun;
            image_xscale = (targetplayer.x != x) ? sign(targetplayer.x - x) : ((x < (room_width / 2)) ? 1 : -1);
            image_index = 0;
            movespeed = 4;
            millionpunch_buffer = millionpunch_max;
            
            with (instance_create(x, y, obj_millionpunchhitbox))
                baddieID = other.id;
        }
    }
}

function vigilante_decide_attack_phase3()
{
    if (attack_cooldown > 0)
    {
        attack_cooldown--;
    }
    else
    {
        targetstunned = 0;
        attack_cooldown = attack_max[phase - 1];
        state = choose(UnknownEnum.Value_1, UnknownEnum.Value_103, UnknownEnum.Value_2);
        
        if (state == UnknownEnum.Value_1)
        {
            revolver_count = 2;
            revolver_jumpcount = 0;
            revolver_jump = irandom_range(-1, revolver_count - 1);
            movespeed = 0;
            sprite_index = spr_playerV_revolverstart;
            image_index = 0;
            
            if (revolver_jump == revolver_jumpcount && grounded)
                vsp = -11;
        }
        else if (state == UnknownEnum.Value_103)
        {
            superkickattackpursuit = true;
            superkickattack_jump = (irandom(100) > 30) ? true : false;
            movespeed = 0;
            sprite_index = spr_playerV_mach1;
            image_index = 0;
        }
        else if (state == UnknownEnum.Value_2)
        {
            dynamite_shot = true;
            sprite_index = spr_playerV_dynamitethrow;
            image_index = 0;
            
            with (instance_create(x, y, obj_dynamite))
            {
                obj_explosion = 85;
                image_xscale = other.image_xscale;
                movespeed = 6;
                vsp = -6;
            }
        }
    }
}

function vigilante_decide_attack_phase1()
{
    if (attack_cooldown > 0)
    {
        attack_cooldown--;
    }
    else
    {
        targetstunned = 0;
        attack_cooldown = attack_max[phase - 1];
        state = choose(UnknownEnum.Value_103, UnknownEnum.Value_103, UnknownEnum.Value_1, UnknownEnum.Value_1, UnknownEnum.Value_1, UnknownEnum.Value_92, UnknownEnum.Value_92);
        
        if (state == UnknownEnum.Value_1)
        {
            revolver_count = (phase == 1) ? 1 : 2;
            movespeed = 0;
            sprite_index = spr_playerV_revolverstart;
            image_index = 0;
        }
        else if (state == UnknownEnum.Value_103)
        {
            superkickattackpursuit = !(phase == 1);
            movespeed = 0;
            sprite_index = spr_playerV_mach1;
            image_index = 0;
        }
        else if (state == UnknownEnum.Value_92)
        {
            vsp = -14;
            hsp = 0;
            movespeed = 0;
            sprite_index = spr_playerV_jump;
            image_index = 0;
            dynamite_buffer = dynamite_max;
            dynamite_count = (phase == 1) ? 1 : 2;
            instance_create(x, y, obj_highjumpcloud2);
        }
    }
}

function vigilante_decide_normalattack()
{
    if (normalattack_cooldown > 0)
    {
        normalattack_cooldown--;
    }
    else if (distance_to_pos(x, y, targetplayer.x, targetplayer.y, 180, 340))
    {
        normalattack_cooldown = normalattack_max[phase - 1];
        
        if (targetplayer.y <= (y - 24))
        {
            state = UnknownEnum.Value_82;
            vsp = -14;
            movespeed = 2;
            sprite_index = spr_playerV_superjump;
            image_xscale = (targetplayer.x != x) ? sign(targetplayer.x - x) : image_xscale;
            image_index = 0;
            instance_create(x, y, obj_highjumpcloud2);
        }
        else
        {
            state = UnknownEnum.Value_42;
            movespeed = 8;
            sprite_index = spr_playerV_mach3boost;
            image_index = 0;
            
            with (instance_create(x, y, obj_superdashcloud))
                image_xscale = other.image_xscale;
            
            with (instance_create(x, y, obj_crazyrunothereffect))
                image_xscale = other.image_xscale;
        }
    }
}

function boss_vigilante_normal_phase4()
{
    var targetspeed;
    
    image_speed = 0.35;
    
    if (targetplayer.hsp != 0 && targetplayer.state != UnknownEnum.Value_156 && distance_to_object(targetplayer) < 500)
        move = sign(targetplayer.hsp);
    else
        move = 0;
    
    if (distance_to_object(targetplayer) < 128)
        move = -sign(targetplayer.x - x);
    
    hsp = move * movespeed;
    
    if (x != targetplayer.x)
        image_xscale = sign(targetplayer.x - x);
    
    targetspeed = (move == image_xscale) ? normal_spd : (normal_spd - 2);
    
    if (move != 0)
    {
        if (movespeed < targetspeed)
            movespeed += 0.25;
        else if (movespeed > targetspeed)
            movespeed -= 0.5;
        
        if (movespeed < 3)
            image_speed = 0.35;
        else if (movespeed > 3 && movespeed < 6)
            image_speed = 0.45;
        else
            image_speed = 0.6;
    }
    else if (movespeed > 0)
    {
        movespeed -= 0.1;
    }
    else if (movespeed <= 0)
    {
        movespeed = 0;
    }
    
    boss_decide_taunt(180);
    
    if (state != UnknownEnum.Value_84)
    {
        boss_vigilante_decide_attack();
        vigilante_decide_normalattack();
    }
    
    if (state == UnknownEnum.Value_0)
    {
        if (hsp != 0)
            sprite_index = walkspr;
        else
            sprite_index = idlespr;
    }
}

function boss_vigilante_normal()
{
    var targetspeed;
    
    image_speed = 0.35;
    
    if (targetplayer.hsp != 0 && targetplayer.state != UnknownEnum.Value_156 && distance_to_object(targetplayer) < 480)
        move = sign(targetplayer.hsp);
    else
        move = 0;
    
    if (distance_to_object(targetplayer) < 300)
        move = -sign(targetplayer.x - x);
    
    if (distance_to_object(targetplayer) > 500)
        move = sign(targetplayer.x - x);
    
    hsp = move * movespeed;
    
    if (x != targetplayer.x)
        image_xscale = sign(targetplayer.x - x);
    
    targetspeed = (move == image_xscale) ? (normal_spd - 2) : normal_spd;
    
    if (move != 0)
    {
        if (movespeed < targetspeed)
            movespeed += 0.25;
        else if (movespeed > targetspeed)
            movespeed -= 0.5;
        
        if (movespeed < 3)
            image_speed = 0.35;
        else if (movespeed > 3 && movespeed < 6)
            image_speed = 0.45;
        else
            image_speed = 0.6;
    }
    else if (movespeed > 0)
    {
        movespeed -= 0.1;
    }
    else if (movespeed <= 0)
    {
        movespeed = 0;
    }
    
    boss_decide_taunt(180);
    
    if (state != UnknownEnum.Value_84)
        boss_vigilante_decide_attack();
    
    if (state == UnknownEnum.Value_0)
    {
        if ((x < (room_width / 8) || x > (room_width - (room_width / 8))) && distance_to_object(targetplayer) < 172)
        {
            state = UnknownEnum.Value_149;
            
            if (phase == 3)
                changeside_skid = true;
        }
        
        if (hsp != 0)
            sprite_index = walkspr;
        else
            sprite_index = idlespr;
    }
}

function boss_vigilante_float()
{
    image_speed = 0.35;
    sprite_index = spr_playerV_crouchmove;
    hsp = image_xscale * changeside_spd;
    movespeed = 0;
    
    if (changeside_skid && place_meeting(x + (sign(hsp) * 128), y, obj_solid))
    {
        state = UnknownEnum.Value_105;
        movespeed = 12;
        sprite_index = spr_playerV_mach2boost;
    }
    
    if (place_meeting(x + (sign(hsp) * 64), y, obj_solid))
    {
        image_xscale = (x < (room_width / 2)) ? 1 : -1;
        state = UnknownEnum.Value_0;
    }
}

function boss_vigilante_revolver()
{
    image_speed = (phase != 6) ? 0.35 : 0.5;
    hsp = 0;
    
    if (image_index > (image_number - 1))
    {
        if (sprite_index == spr_playerV_revolverstart || sprite_index == spr_playerV_airrevolverstart)
        {
            sprite_index = spr_playerV_revolvershoot;
            image_index = 0;
            
            with (instance_create(x + (image_xscale * 20), y + 20, obj_revolvershot))
                image_xscale = other.image_xscale;
            
            revolver_count--;
            revolver_jumpcount++;
            
            if (revolver_jump == revolver_jumpcount)
            {
                vsp = -11;
                sprite_index = spr_playerV_airrevolver;
                instance_create(x, y, obj_highjumpcloud2);
            }
            
            scr_soundeffect(26);
        }
        else if (sprite_index == spr_playerV_revolvershoot || sprite_index == spr_playerV_airrevolver)
        {
            if (revolver_count <= 0)
            {
                sprite_index = idlespr;
                state = UnknownEnum.Value_0;
                revolver_jump = -1;
            }
            else
            {
                sprite_index = grounded ? spr_playerV_revolvershoot : spr_playerV_airrevolver;
                image_index = 0;
                
                with (instance_create(x + (image_xscale * 20), y + 20, obj_revolvershot))
                    image_xscale = other.image_xscale;
                
                scr_soundeffect(26);
                revolver_count--;
                revolver_jumpcount++;
                
                if (revolver_jump == revolver_jumpcount)
                {
                    vsp = -11;
                    sprite_index = spr_playerV_airrevolver;
                    instance_create(x, y, obj_highjumpcloud2);
                }
            }
        }
    }
    
    if (phase > 4)
        vigilante_cancel_attack(UnknownEnum.Value_2, UnknownEnum.Value_128);
}

function boss_vigilante_mach1()
{
    var tx;
    
    image_speed = 0.6;
    hsp = image_xscale * movespeed;
    
    if (movespeed < 12)
        movespeed += 0.5;
    
    if (sprite_index == spr_playerV_mach1 && image_index > (image_number - 1))
        sprite_index = spr_playerV_bootsmove;
    
    tx = (phase == 1) ? 224 : 380;
    
    if (!superkickattackpursuit && !superkickattack_jump && distance_to_pos(x, y, targetplayer.x, targetplayer.y, tx, 540) && grounded)
    {
        state = UnknownEnum.Value_102;
        movespeed = (phase == 1) ? 12 : 15;
        sprite_index = spr_playerV_divekickstart;
        image_index = 0;
    }
    
    if (!superkickattackpursuit && superkickattack_jump && distance_to_pos(x, y, targetplayer.x, targetplayer.y, 400, 540) && grounded)
    {
        vsp = -11;
        state = UnknownEnum.Value_92;
        movespeed = 12;
        dynamite_count = 0;
        dynamite_buffer = 0;
        sprite_index = spr_playerV_bootsjump;
        image_index = 0;
        instance_create(x, y, obj_highjumpcloud2);
    }
    
    if (superkickattackpursuit && place_meeting(x + (sign(hsp) * 116), y, obj_solid))
    {
        state = UnknownEnum.Value_105;
        movespeed = 12;
        sprite_index = spr_playerV_mach2boost;
        superkickattackpursuit = false;
    }
    
    if (place_meeting(x + sign(hsp), y, obj_solid))
    {
        state = UnknownEnum.Value_106;
        hsp = -image_xscale * 6;
        vsp = -4;
    }
    
    if (!instance_exists(dashcloudid) && grounded)
    {
        with (instance_create(x, y, obj_dashcloud))
        {
            image_xscale = other.image_xscale;
            other.dashcloudid = id;
        }
    }
    
    if (phase > 4)
        vigilante_cancel_attack(!honor ? UnknownEnum.Value_1 : UnknownEnum.Value_42, UnknownEnum.Value_128);
}

function boss_vigilante_crouchslide()
{
    image_speed = (phase != 6) ? 0.35 : 0.5;
    hsp = image_xscale * movespeed;
    
    if (sprite_index == spr_playerV_divekickstart && image_index > (image_number - 1))
        sprite_index = spr_playerV_divekick;
    
    if (grounded)
    {
        if (sprite_index == spr_playerV_dive)
            sprite_index = spr_playerV_divekick;
        
        if (movespeed > 0)
        {
            movespeed -= 0.2;
        }
        else
        {
            movespeed = 0;
            state = UnknownEnum.Value_0;
        }
    }
    
    if (place_meeting(x + sign(hsp), y, obj_solid))
    {
        state = UnknownEnum.Value_106;
        hsp = -image_xscale * 6;
        vsp = -4;
    }
    
    if (phase > 4)
        vigilante_cancel_attack(UnknownEnum.Value_164, UnknownEnum.Value_128, UnknownEnum.Value_82);
}

function boss_vigilante_machslide()
{
    hsp = image_xscale * movespeed;
    
    if (movespeed > 0)
        movespeed -= 0.4;
    else
        movespeed = 0;
    
    image_speed = (phase != 6) ? 0.35 : 0.5;
    
    if (image_index > (image_number - 1))
    {
        if (sprite_index == spr_playerV_mach2boost)
        {
            sprite_index = spr_playerV_bootsmove;
            state = UnknownEnum.Value_103;
            superkickattackpursuit = false;
            movespeed = 12;
            image_xscale *= -1;
        }
    }
}

function boss_vigilante_jump()
{
    image_speed = (phase != 6) ? 0.35 : 0.5;
    hsp = image_xscale * movespeed;
    
    if (dynamite_buffer > 0)
    {
        dynamite_buffer--;
    }
    else if (dynamite_count > 0)
    {
        state = UnknownEnum.Value_2;
        sprite_index = spr_playerV_dynamitethrow;
        image_index = 0;
        
        repeat (dynamite_count)
        {
            with (instance_create(x, y, obj_dynamite))
            {
                obj_explosion = 85;
                image_xscale = other.image_xscale;
                movespeed = 6;
                vsp = -(6 + ((other.dynamite_count - 1) * 2));
                movespeed += ((other.dynamite_count - 1) * 4);
            }
            
            dynamite_count--;
        }
        
        dynamite_count = 0;
    }
    
    if (sprite_index == spr_playerV_bootsjump && vsp >= 0)
    {
        sprite_index = spr_playerV_dive;
        image_index = 0;
        state = UnknownEnum.Value_102;
        vsp = 10;
    }
    
    if (image_index > (image_number - 1) && sprite_index == spr_playerV_jump)
        sprite_index = spr_playerV_fall;
    
    if (grounded)
        state = UnknownEnum.Value_0;
}

function boss_vigilante_dynamite()
{
    image_speed = (phase != 6) ? 0.4 : 0.6;
    
    if (image_index > (image_number - 1))
    {
        state = UnknownEnum.Value_92;
        sprite_index = spr_playerV_fall;
        
        if (dynamite_shot)
        {
            state = UnknownEnum.Value_1;
            sprite_index = spr_playerV_revolverstart;
            image_index = 0;
            revolver_count = 1;
            revolver_jump = -1;
        }
    }
}

function boss_vigilante_charge()
{
    image_speed = (phase != 6) ? 0.35 : 0.4;
    hsp = image_xscale * movespeed;
    
    if (image_index > (image_number - 1))
    {
        movespeed = 17;
        state = UnknownEnum.Value_80;
        sprite_index = spr_playerV_divekick;
    }
}

function boss_vigilante_punch()
{
    image_speed = (phase != 6) ? 0.35 : 0.5;
    hsp = image_xscale * movespeed;
    
    if (place_meeting(x + sign(hsp), y, obj_solid))
    {
        state = UnknownEnum.Value_106;
        hsp = -image_xscale * 6;
        vsp = -4;
    }
    
    if (movespeed > 0)
    {
        movespeed -= 0.2;
    }
    else
    {
        movespeed = 0;
        state = UnknownEnum.Value_0;
    }
    
    if (phase > 4)
        vigilante_cancel_attack(UnknownEnum.Value_164, UnknownEnum.Value_82);
}

function boss_vigilante_groundpunchstart()
{
    image_speed = (phase != 6) ? 0.35 : 0.5;
    
    if (x > (targetplayer.x - 32) && x < (targetplayer.x + 32))
    {
        move = 0;
    }
    else
    {
        image_xscale = (targetplayer.x != x) ? sign(targetplayer.x - x) : image_xscale;
        move = image_xscale;
    }
    
    hsp = move * movespeed;
    
    if (movespeed < (normal_spd + 1))
        movespeed += 0.5;
    else
        movespeed = normal_spd + 1;
    
    if (sprite_index == spr_playerV_jump && image_index > (image_number - 1))
    {
        sprite_index = spr_playerV_fall;
        image_index = 0;
    }
    
    if (vsp > 0)
    {
        image_index = 0;
        sprite_index = spr_playerV_bodyslamprep;
        state = UnknownEnum.Value_122;
        vsp = -5;
    }
}

function boss_vigilante_freefallprep()
{
    if (x > (targetplayer.x - 24) && x < (targetplayer.x + 24))
    {
        move = 0;
    }
    else
    {
        image_xscale = (targetplayer.x != x) ? sign(targetplayer.x - x) : image_xscale;
        move = image_xscale;
    }
    
    if (movespeed < 7)
        movespeed += 0.2;
    else if (movespeed > 7)
        movespeed -= 0.1;
    else
        movespeed = 7;
    
    hsp = move * movespeed;
    
    if (image_index > (image_number - 1))
    {
        vsp += 14;
        state = UnknownEnum.Value_108;
        sprite_index = spr_playerV_bodyslam;
        image_index = 0;
    }
}

function boss_vigilante_freefall()
{
    if (x > (targetplayer.x - 24) && x < (targetplayer.x + 24))
    {
        move = 0;
        movespeed = 0;
    }
    else
    {
        image_xscale = (targetplayer.x != x) ? sign(targetplayer.x - x) : image_xscale;
        move = image_xscale;
    }
    
    if (movespeed < 7)
        movespeed += 0.2;
    else if (movespeed > 7)
        movespeed -= 0.1;
    else
        movespeed = 7;
    
    hsp = move * movespeed;
    vsp = 20;
    image_speed = (phase != 6) ? 0.35 : 0.5;
    sprite_index = spr_playerV_bodyslam;
    
    if (grounded)
    {
        movespeed = 0;
        state = UnknownEnum.Value_111;
        sprite_index = spr_playerV_bodyslamland;
        image_index = 0;
    }
}

function boss_vigilante_freefallland()
{
    hsp = image_xscale * movespeed;
    image_speed = (phase != 6) ? 0.35 : 0.5;
    
    if (image_index > (image_number - 1))
        state = UnknownEnum.Value_0;
    
    if (phase > 4)
        vigilante_cancel_attack(!honor ? UnknownEnum.Value_1 : UnknownEnum.Value_42, UnknownEnum.Value_82);
}

function boss_vigilante_millionpunch()
{
    image_speed = (phase != 6) ? 0.6 : 0.7;
    
    if (x > (targetplayer.x - 24) && x < (targetplayer.x + 24))
    {
        move = 0;
    }
    else
    {
        image_xscale = (targetplayer.x != x) ? sign(targetplayer.x - x) : image_xscale;
        move = image_xscale;
    }
    
    hsp = move * movespeed;
    
    if (millionpunch_buffer > 0)
        millionpunch_buffer--;
    else
        state = UnknownEnum.Value_0;
    
    if (phase > 4)
        vigilante_cancel_attack(UnknownEnum.Value_164, UnknownEnum.Value_82);
}

function boss_vigilante_uppunch()
{
    hsp = image_xscale * movespeed;
    
    if (image_index > (image_number - 1))
        image_index = image_number - 1;
    
    if (grounded)
        state = UnknownEnum.Value_0;
    
    if (phase > 4)
        vigilante_cancel_attack(UnknownEnum.Value_42, UnknownEnum.Value_82);
}

function boss_vigilante_handstandjump()
{
    image_speed = (phase != 6) ? 0.35 : 0.4;
    hsp = image_xscale * movespeed;
    
    if (movespeed < 10)
        movespeed += 0.5;
    else
        movespeed = 10;
    
    if (image_index > (image_number - 1))
        state = UnknownEnum.Value_0;
    
    if (phase > 4)
        vigilante_cancel_attack(UnknownEnum.Value_92);
}

function boss_vigilante_superattackstart()
{
    var tx, tx2;
    
    tx = room_width - (room_width / 3);
    x = Approach(x, tx, movespeed);
    hsp = 0;
    
    if (movespeed < 8)
        movespeed += 0.5;
    
    image_xscale = (x > (room_width / 2)) ? -1 : 1;
    
    if (x != tx)
    {
        sprite_index = grounded ? walkspr : fallspr;
    }
    else
    {
        movespeed = 0;
        sprite_index = grounded ? idlespr : fallspr;
    }
    
    if (movespeed < 3)
        image_speed = 0.35;
    else if (movespeed > 3 && movespeed < 6)
        image_speed = 0.45;
    else
        image_speed = 0.6;
    
    with (lastplayerid)
    {
        if (object_index == obj_player1 || global.coop)
        {
            tx2 = room_width / 3;
            x = Approach(x, tx2, movespeed);
            hsp = 0;
            
            if (movespeed < 8)
                movespeed += 0.5;
            
            xscale = (x > (room_width / 2)) ? -1 : 1;
            
            if (x != tx2)
            {
                sprite_index = grounded ? spr_move : spr_fall;
            }
            else
            {
                movespeed = 0;
                sprite_index = grounded ? spr_idle : spr_fall;
            }
            
            if (movespeed < 3)
                image_speed = 0.35;
            else if (movespeed > 3 && movespeed < 6)
                image_speed = 0.45;
            else
                image_speed = 0.6;
        }
    }
    
    if (x == tx && obj_player1.x == tx2)
    {
        state = UnknownEnum.Value_160;
        
        with (lastplayerid)
        {
            if (object_index == obj_player1 || global.coop)
                state = UnknownEnum.Value_160;
        }
        
        duel_buffer = duel_max + irandom(duel_random);
    }
}

function boss_vigilante_superattack()
{
    if (duel_buffer > 0)
    {
        if (lastplayerid.state != UnknownEnum.Value_137 && lastplayerid.state != UnknownEnum.Value_156)
            duel_buffer--;
    }
    else if (duel_buffer == 0)
    {
        duel_buffer = -1;
        duelinst = instance_create(room_width / 2, room_height / 2, obj_cloudeffect);
        
        with (duelinst)
        {
            sprite_index = spr_taunteffect;
            image_speed = 0.5;
        }
    }
    
    if (image_index > (image_number - 1))
    {
        if (sprite_index == spr_playerV_revolvershoot)
        {
            sprite_index = spr_playerV_revolverend;
            image_index = 0;
        }
        else if (sprite_index == spr_playerV_revolverend)
        {
            sprite_index = spr_playerV_idle;
        }
    }
    
    if (sprite_index != spr_playerV_revolvershoot && sprite_index != spr_playerV_revolverend && sprite_index != spr_playerV_idle)
        sprite_index = spr_playerV_idle;
    
    if (duel_buffer == -1 && !instance_exists(duelinst))
    {
        duel_buffer = -2;
        duelinst = -4;
        sprite_index = spr_playerV_revolvershoot;
        image_index = 0;
        
        with (instance_create(x + (image_xscale * 20), y + 20, obj_revolvershot))
        {
            image_xscale = other.image_xscale;
            dmg = 150;
        }
    }
    
    with (lastplayerid)
    {
        if (state != UnknownEnum.Value_160 && state != UnknownEnum.Value_137 && state != UnknownEnum.Value_156 && state != UnknownEnum.Value_61)
        {
            state = UnknownEnum.Value_160;
            x = room_width / 3;
        }
        
        xscale = 1;
        
        if (other.duel_buffer == -1 && (key_slap2 || key_shoot2 || key_jump2))
        {
            other.duel_buffer = -2;
            instance_create(x + (image_xscale * 20), y, obj_shotgunbullet);
            sprite_index = spr_player_pistolshot;
            image_index = 0;
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_42 = 42,
    Value_61 = 61,
    Value_80 = 80,
    Value_82 = 82,
    Value_84 = 84,
    Value_92 = 92,
    Value_102 = 102,
    Value_103,
    Value_105 = 105,
    Value_106,
    Value_108 = 108,
    Value_111 = 111,
    Value_122 = 122,
    Value_128 = 128,
    Value_137 = 137,
    Value_149 = 149,
    Value_156 = 156,
    Value_158 = 158,
    Value_160 = 160,
    Value_164 = 164,
    Value_166 = 166
}
