function scr_collide_player()
{
    var vsp_final, hsp_final, k, i;
    
    grounded = false;
    grinding = false;
    vsp_final = vsp + vsp_carry;
    vsp_carry = 0;
    
    repeat (abs(vsp_final))
    {
        if (!scr_solid_player(x, y + sign(vsp_final)))
        {
            y += sign(vsp_final);
        }
        else
        {
            vsp = 0;
            break;
        }
    }
    
    hsp_final = hsp + hsp_carry;
    hsp_carry = 0;
    
    repeat (abs(hsp_final))
    {
        for (k = 1; k <= 4; k++)
        {
            if (scr_solid_player(x + sign(hsp_final), y) && !scr_solid_player(x + sign(hsp_final), y - k))
                y -= k;
            
            if (!scr_solid_player(x + sign(hsp_final), y) && !scr_solid_player(x + sign(hsp_final), y + 1) && scr_solid_player(x + sign(hsp_final), y + (k + 1)))
                y += k;
        }
        
        if (!scr_solid_player(x + sign(hsp_final), y))
        {
            x += sign(hsp_final);
        }
        else
        {
            hsp = 0;
            break;
        }
    }
    
    if (vsp < 20)
        vsp += grav;
    
    if (platformid != -4)
    {
        if (vsp < -1 || !instance_exists(platformid) || (!place_meeting(x, y + 16, platformid) || !place_meeting(x, y + 32, platformid)))
        {
            platformid = -4;
            y = floor(y);
        }
        else
        {
            grounded = true;
            vsp = grav;
            
            if (platformid.vsp > 0)
                vsp_carry = platformid.vsp;
            
            y = platformid.y - 46;
            
            if (!place_meeting(x, y + 1, platformid))
                y++;
            
            if (platformid.v_velocity != 0)
            {
                if (scr_solid(x, y))
                {
                    for (i = 0; scr_solid(x, y); i++)
                    {
                        y--;
                        
                        if (i > 32)
                            break;
                    }
                }
                
                if (scr_solid(x, y))
                {
                    for (i = 0; scr_solid(x, y); i++)
                    {
                        y++;
                        
                        if (i > 64)
                            break;
                    }
                }
            }
        }
    }
    
    grounded |= scr_solid(x, y + 1);
    grounded |= (vsp > 0 && !place_meeting(x, y, obj_platform) && place_meeting(x, y + 1, obj_platform));
    grinding = !place_meeting(x, y, obj_grindrail) && place_meeting(x, y + 1, obj_grindrail);
    grounded |= grinding;
    
    if (platformid != -4 || (place_meeting(x, y + 1, obj_movingplatform) && !place_meeting(x, y - 3, obj_movingplatform)) || place_meeting(x, y + 8, 101 && !place_meeting(x, y + 6, obj_movingplatform)))
        grounded = true;
    
    if (grounded && platformid == -4)
        y = floor(y);
}