function scr_player_ratmount()
{
    move = key_left + key_right;
    doublejump = false;
    
    if (ratgrabbedID != -4 && !instance_exists(ratgrabbedID))
        ratgrabbedID = -4;
    
    hsp = movespeed;
    
    if ((place_meeting(x + xscale, y, obj_solid) && !place_meeting(x + hsp, y, obj_destructibles)) || (abs(movespeed) < 8 && move != xscale) || !key_attack || abs(movespeed) <= 6)
    {
        gustavodash = 0;
        ratmount_movespeed = 8;
    }
    
    if ((place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_slope) && !place_meeting(x + hsp, y, obj_destructibles)) && gustavodash != 51)
        movespeed = 0;
    
    if (ratmount_movespeed == 12 && gustavodash != 51)
    {
        ratmount_movespeed = 12;
        instance_create(x, y, obj_jumpdust);
        gustavodash = 51;
    }
    
    if (key_jump)
        input_buffer_jump = 0;
    
    if (move != xscale && move != 0)
    {
        xscale = move;
        
        if (abs(movespeed) > 2 && grounded)
        {
            state = states.ratmountskid;
            movespeed = abs(movespeed);
        }
    }
    
    if (move != 0)
    {
        if (move == xscale)
            movespeed = Approach(movespeed, xscale * ratmount_movespeed, 0.5);
        else
            movespeed = Approach(movespeed, 0, 0.5);
    }
    else
    {
        movespeed = Approach(movespeed, 0, 0.5);
    }
    
    if (abs(movespeed) < 3 && move != 0)
        image_speed = 0.35;
    else if (abs(movespeed) > 3 && abs(movespeed) < 6)
        image_speed = 0.45;
    else
        image_speed = 0.6;
    
    if (brick)
    {
        if (!landAnim)
        {
            if (hsp != 0)
            {
                if (ratmount_movespeed >= 12)
                    sprite_index = spr_player_ratmountattack;
                else
                    sprite_index = spr_player_ratmountmove;
            }
            else
            {
                image_speed = 0.35;
                
                if (sprite_index != spr_player_ratmountidleanim)
                {
                    sprite_index = spr_player_ratmountidle;
                    
                    if (ratgrabbedID == -4)
                    {
                        if (idle < 400)
                            idle++;
                        
                        if (idle >= 150)
                        {
                            sprite_index = spr_player_ratmountidleanim;
                            image_index = 0;
                        }
                    }
                }
                else if (floor(image_index) == (image_number - 1))
                {
                    idle = 0;
                    sprite_index = spr_player_ratmountidle;
                }
            }
        }
        
        if (floor(image_index) == (image_number - 1))
        {
            landAnim = false;
            
            if (sprite_index == spr_player_ratmountland)
                sprite_index = spr_player_ratmountidle;
        }
        
        if (sprite_index == spr_player_ratmountland)
            image_speed = 0.35;
    }
    else
    {
        if (hsp != 0)
        {
            if (ratmount_movespeed >= 12)
                sprite_index = spr_lonegustavo_dash;
            else
                sprite_index = spr_lonegustavo_walk;
        }
        else
        {
            sprite_index = spr_lonegustavo_idle;
        }
        
        image_speed = 0.35;
    }
    
    if (hsp != 0 && !steppy && floor(image_index) == 7)
    {
        steppy = true;
        create_particle(x, y + 38, states.revolver, 0);
    }
    
    if (hsp != 0 && floor(image_index) != 7)
        steppy = false;
    
    if (input_buffer_jump < 8 && grounded && sprite_index != spr_player_ratmountswallow)
    {
        particle_set_scale(particles.highjumpcloud2, xscale, 1);
        create_particle(x, y, particles.highjumpcloud2, 0);
        scr_soundeffect(12);
        
        if (brick)
            sprite_index = spr_player_ratmountjump;
        else if (ratmount_movespeed >= 12)
            sprite_index = spr_lonegustavo_dashjump;
        else
            sprite_index = spr_player_ratmountgroundpound;
        
        image_index = 0;
        jumpAnim = true;
        state = states.ratmountjump;
        vsp = -11;
        jumpstop = false;
    }
    
    if (!grounded && sprite_index != spr_player_ratmountswallow)
    {
        state = states.ratmountjump;
        jumpAnim = false;
        
        if (brick)
            sprite_index = spr_player_ratmountfall;
        else
            sprite_index = spr_player_ratmountgroundpoundfall;
    }
    
    if (key_attack && grounded && !place_meeting(x + xscale, y, obj_solid))
    {
        move = xscale;
        
        if (ratmount_movespeed < 12)
            ratmount_movespeed += 0.1;
    }
    
    if (key_slap2 && brick)
    {
        ratmount_kickbrick();
    }
    else if (key_slap2 && !brick)
    {
        ratmountpunchtimer = 25;
        state = UnknownEnum.Value_259;
        image_index = 0;
        
        if (move != 0)
            xscale = move;
        
        movespeed = xscale * 12;
        sprite_index = spr_lonegustavo_punch;
    }
    
    if (!instance_exists(dashcloudid) && grounded && ratmount_movespeed >= 12)
    {
        with (instance_create(x, y, obj_dashcloud))
        {
            image_xscale = other.xscale;
            other.dashcloudid = id;
        }
    }
    
    if ((key_down && grounded && vsp > 0) || scr_solid(x, y))
    {
        state = UnknownEnum.Value_260;
        
        if (brick == true)
        {
            with (instance_create(x, y, obj_brickcomeback))
            {
                wait = true;
                instance_create(x, y, obj_genericpoofeffect);
            }
        }
        
        brick = false;
    }
    
    with (ratgrabbedID)
        scr_enemy_ratgrabbed();
    
    ratmount_shootpowerup();
    ratmount_dotaunt();
}

function ratmount_dotaunt()
{
    if (key_taunt2 && state != states.backbreaker && brick)
    {
        scr_soundeffect(84);
        tauntstoredisgustavo = true;
        taunttimer = 20;
        tauntstoredmovespeed = movespeed;
        tauntstoredsprite = sprite_index;
        tauntstoredstate = state;
        tauntstoredvsp = vsp;
        state = states.backbreaker;
        sprite_index = spr_player_ratmounttaunt;
        
        with (instance_create(x, y, obj_taunteffect))
            player = other.id;
    }
}

function ratmount_kickbrick()
{
    var _pad;
    
    _pad = 32;
    
    with (instance_create(x + (image_xscale * _pad), y, obj_brickball))
    {
        if (other.state == states.ratmountjump || other.state == states.ratmountbounce)
            up = true;
        
        image_xscale = other.xscale;
        xoffset = _pad;
    }
    
    state = states.ratmountgroundpound;
    sprite_index = spr_lonegustavo_kick;
    image_index = 0;
    image_speed = 0.35;
    gustavokicktimer = 5;
    brick = false;
}

function ratmount_shootpowerup()
{
    if (key_shoot2 && ratpowerup != -4 && ratshootbuffer <= 0)
    {
        switch (ratpowerup)
        {
            case 445:
                with (instance_create(x + (20 * xscale), y, obj_playernoisearrow))
                    direction = point_direction(x, y, x + (other.xscale * 4), y);
                
                break;
            
            case 222:
                with (instance_create(x + (20 * xscale), y + 20, obj_playersmokehitbox))
                {
                    spd += (other.movespeed / 2);
                    image_xscale = other.xscale;
                }
                
                break;
            
            case 460:
                with (instance_create(x + (20 * xscale), y, obj_playerspikecheese))
                {
                    spd += other.movespeed;
                    image_xscale = other.xscale;
                }
                
                break;
        }
        
        ratshootbuffer = 30;
    }
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_4 = 4,
    Value_84 = 84,
    Value_192 = 192,
    Value_197 = 197,
    Value_198,
    Value_204 = 204,
    Value_259 = 259,
    Value_260
}
