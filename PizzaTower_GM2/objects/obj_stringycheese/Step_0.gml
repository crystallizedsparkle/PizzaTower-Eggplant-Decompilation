var _dir, spd, tx, ty, s1;

targetplayer = instance_nearest(x, y, obj_player);
image_speed = 0.35;

switch (state)
{
    case states.normal:
        hand_xscale = (drawhandx < x) ? 1 : -1;
        idlebuffer = 0;
        spr_hand = 507;
        sprite_index = spr_mrpinch_face1;
        _dir = point_direction(x, y, targetplayer.x, targetplayer.y);
        spd = (shootbuffer > 0) ? 3 : 10;
        tx = targetplayer.x;
        ty = targetplayer.y;
        
        if (point_distance(x, y, handx, handy) >= (maxhandlen - 20))
        {
            tx = x + lengthdir_x(maxhandlen, _dir);
            ty = y + lengthdir_y(maxhandlen, _dir);
            _dir = point_direction(x, y, tx, ty);
        }
        
        handx = Approach(handx, tx, spd);
        handy = Approach(handy, ty, spd);
        
        if (handy < y)
            handy = y;
        
        drawhandx = lerp(drawhandx, handx, 0.2);
        drawhandy = lerp(drawhandy, handy, 0.2);
        
        if (shootbuffer > 0)
            shootbuffer--;
        
        if (shootbuffer <= 0 && place_meeting(handx, handy, obj_player))
        {
            playerid = instance_place(handx, handy, obj_player);
            launch_hsp = sign(playerid.hsp) * 3;
            launch_vsp = -20;
            hsp = playerid.hsp;
            vsp = 10;
            
            with (playerid)
            {
                tauntstoredstate = state;
                tauntstoredsprite = sprite_index;
                state = states.stringfall;
                stringid = other.id;
                movespeed = hsp;
            }
            
            state = states.hook;
        }
        
        break;
    
    case states.hook:
        sprite_index = spr_mrpinch_face2;
        spr_hand = 2688;
        handx = playerid.x;
        handy = playerid.y;
        drawhandx = handx;
        drawhandy = handy;
        
        if (handy < (y - 200) || playerid.state == states.tube)
        {
            state = states.normal;
            
            with (playerid)
            {
                if (state == states.stringfall)
                {
                    if (tauntstoredstate == states.cheesepepjump)
                        state = states.cheesepepjump;
                    else
                        state = states.jump;
                }
            }
            
            break;
        }
        
        drawhandx = handx;
        drawhandy = handy;
        hand_xscale = playerid.xscale;
        
        if (playerid.state != states.tube)
        {
            with (playerid)
            {
                sprite_index = spr_player_mrpinch;
                stringid = other.id;
                state = states.stringfall;
                
                if (y > other.y)
                {
                    if (y > (other.y + (other.maxhandlen / 2)) && vsp > 0 && y > other.y)
                    {
                        other.state = states.hookshot;
                        other.shootbuffer = 60;
                        other.launch_dir = point_direction(0, 0, other.launch_hsp, other.launch_vsp);
                        stringid = other.id;
                    }
                }
                
                if (vsp > 0 && y < other.y)
                    other.idlebuffer++;
                else
                    other.idlebuffer = 0;
                
                if (other.idlebuffer > 60)
                {
                    other.state = states.normal;
                    other.shootbuffer = 20;
                    other.idlebuffer = 0;
                    state = states.normal;
                }
            }
        }
        else
        {
            state = states.normal;
        }
        
        break;
    
    case states.hookshot:
        sprite_index = spr_mrpinch_face2;
        hand_index = 2688;
        hand_xscale = playerid.xscale;
        handy = playerid.y;
        handx = playerid.x;
        drawhandx = handx;
        drawhandy = handy;
        s1 = 0.9;
        hsp += lengthdir_x(s1, launch_dir);
        vsp += lengthdir_y(s1, launch_dir);
        
        with (playerid)
        {
            sprite_index = spr_player_mrpinch;
            other.shootbuffer = 10;
            hsp = other.hsp;
            vsp = other.vsp;
            
            if (y <= other.y)
            {
                other.shootbuffer = 0;
                movespeed = abs(movespeed);
                
                if (movespeed != 0)
                    xscale = sign(movespeed);
                
                vsp = other.launch_vsp;
                dir = xscale;
                jumpAnim = true;
                momemtum = true;
                jumpstop = true;
                sprite_index = spr_machfreefall;
                state = states.jump;
                
                with (other)
                {
                    state = states.transitioncutscene;
                    shootbuffer = 80;
                }
            }
        }
        
        break;
    
    case states.transitioncutscene:
        hand_xscale = 1;
        spr_hand = 2383;
        sprite_index = spr_mrpinch_face3;
        handx = Approach(handx, x - 40, 4);
        handy = Approach(handy, y + 5, 4);
        drawhandx = handx;
        drawhandy = handy;
        
        if (shootbuffer > 0)
        {
            shootbuffer--;
        }
        else
        {
            state = states.normal;
            shootbuffer = 30;
        }
        
        break;
}

hand_index += 0.35;

if (hand_index > (sprite_get_number(hand_index) - 1))
    hand_index = frac(hand_index);

enum UnknownEnum
{
    Value_0,
    Value_8 = 8,
    Value_15 = 15,
    Value_19 = 19,
    Value_26 = 26,
    Value_92 = 92,
    Value_150 = 150,
    Value_214 = 214
}
