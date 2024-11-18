function scr_player_climbwall()
{
    switch (character)
    {
        case "P":
            if (windingAnim < 200)
                windingAnim++;
            
            move = key_left + key_right;
            suplexmove = false;
            vsp = -wallspeed;
            
            if (wallspeed < 20)
                wallspeed += 0.15;
            
            if (wallspeed < 0)
            {
                if (mach4mode == false)
                    movespeed += 0.2;
                else
                    movespeed += 0.4;
            }
            
            crouchslideAnim = true;
            
            if (vsp < -5)
                sprite_index = spr_machclimbwall;
            else
                sprite_index = spr_player_clingwall;
            
            if (!key_attack && !skateboarding)
            {
                state = UnknownEnum.Value_0;
                movespeed = 0;
                railmovespeed = 6;
                raildir = -xscale;
            }
            
            if (verticalbuffer <= 0 && place_meeting(x, y - 1, obj_solid) && !place_meeting(x, y - 1, obj_verticalhallway) && !place_meeting(x, y - 1, obj_destructibles) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x - sign(hsp), y, obj_slope))
            {
                trace("climbwall hit head");
                
                if (!skateboarding)
                {
                    sprite_index = spr_superjumpland;
                    scr_soundeffect(27);
                    image_index = 0;
                    state = UnknownEnum.Value_123;
                    machhitAnim = false;
                }
                else if (!key_jump)
                {
                    state = UnknownEnum.Value_106;
                    hsp = -2.5 * xscale;
                    vsp = -3;
                    mach2 = 0;
                    image_index = 0;
                }
            }
            
            if (verticalbuffer <= 0 && !scr_solid(x + xscale, y) && !place_meeting(x, y, obj_verticalhallway) && !place_meeting(x, y - 12, obj_verticalhallway))
            {
                trace("climbwall out");
                instance_create(x, y, obj_jumpdust);
                vsp = 0;
                ledge_bump(32);
                
                if (wallspeed < 6)
                    wallspeed = 6;
                
                if ((wallspeed >= 6 && wallspeed < 12) || skateboarding)
                {
                    state = UnknownEnum.Value_104;
                    movespeed = wallspeed;
                }
                else if (wallspeed >= 12)
                {
                    state = UnknownEnum.Value_121;
                    sprite_index = spr_mach4;
                    movespeed = wallspeed;
                }
            }
            
            if (wallspeed < 0 && place_meeting(x, y + 12, obj_solid))
                wallspeed = 0;
            
            if (key_jump)
            {
                key_jump = false;
                movespeed = 10;
                state = UnknownEnum.Value_104;
                image_index = 0;
                sprite_index = spr_walljumpstart;
                
                if (skateboarding)
                    sprite_index = spr_clownjump;
                
                vsp = -11;
                xscale *= -1;
                jumpstop = false;
                walljumpbuffer = 4;
            }
            
            image_speed = 0.6;
            
            if (!instance_exists(obj_cloudeffect))
                instance_create(x, y + 43, obj_cloudeffect);
            
            break;
        
        case "V":
            if (windingAnim < 200)
                windingAnim++;
            
            move = key_left + key_right;
            suplexmove = false;
            vsp = -wallspeed;
            
            if (wallspeed < 24 && move == xscale)
                wallspeed += 0.1;
            
            crouchslideAnim = true;
            sprite_index = spr_machclimbwall;
            
            if (!key_attack)
            {
                state = UnknownEnum.Value_0;
                movespeed = 0;
            }
            
            if (scr_solid(x, y - 1) && !place_meeting(x, y - 1, obj_destructibles) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x - sign(hsp), y, obj_slope))
            {
                sprite_index = spr_superjumpland;
                scr_soundeffect(27);
                image_index = 0;
                state = UnknownEnum.Value_123;
                machhitAnim = false;
            }
            
            if (!scr_solid(x + xscale, y) && !place_meeting(x, y, obj_verticalhallway))
            {
                instance_create(x, y, obj_jumpdust);
                vsp = 0;
                
                if (movespeed >= 6)
                    state = UnknownEnum.Value_104;
                
                if (movespeed >= 12)
                {
                    state = UnknownEnum.Value_121;
                    sprite_index = spr_mach4;
                }
            }
            
            if (key_jump)
            {
                movespeed = 8;
                state = UnknownEnum.Value_104;
                image_index = 0;
                sprite_index = spr_walljumpstart;
                vsp = -11;
                xscale *= -1;
                jumpstop = false;
            }
            
            if ((grounded && wallspeed <= 0) || wallspeed <= 0)
            {
                state = UnknownEnum.Value_92;
                sprite_index = spr_fall;
            }
            
            image_speed = 0.6;
            
            if (!instance_exists(obj_cloudeffect))
                instance_create(x, y + 43, obj_cloudeffect);
            
            break;
        
        case "N":
            hsp = 0;
            
            if (sprite_index == spr_playerN_wallclingstart && floor(image_index) == (image_number - 1))
                sprite_index = spr_playerN_wallcling;
            
            if (sprite_index == spr_playerN_wallcling)
                vsp = 2;
            else
                vsp = 0;
            
            wallclingcooldown = 0;
            
            if (floor(image_index) == (image_number - 1) || !key_jump2)
            {
                vsp = -15;
                state = UnknownEnum.Value_92;
                sprite_index = spr_playerN_jump;
                image_index = 0;
            }
            
            if (key_jump)
            {
                vsp = -15;
                state = UnknownEnum.Value_92;
                sprite_index = spr_playerN_jump;
                image_index = 0;
            }
            
            image_speed = 0.35;
            break;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_92 = 92,
    Value_104 = 104,
    Value_106 = 106,
    Value_121 = 121,
    Value_123 = 123
}