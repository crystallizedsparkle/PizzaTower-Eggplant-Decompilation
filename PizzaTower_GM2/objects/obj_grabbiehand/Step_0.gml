var spd, _dir;

switch (state)
{
    case UnknownEnum.Value_0:
        break;
    
    case UnknownEnum.Value_8:
        if (floor(image_index) == (image_number - 1))
        {
            state = UnknownEnum.Value_135;
            sprite_index = spr_grabbiehand_fall;
        }
        
        break;
    
    case UnknownEnum.Value_135:
        spd = 12;
        shootdir = angle_rotate(shootdir, point_direction(x, y, targetplayer.x, targetplayer.y), turnspeed);
        hsp = lengthdir_x(spd, shootdir);
        vsp = lengthdir_y(spd, shootdir);
        
        if (hsp != 0)
            image_xscale = sign(hsp);
        
        if (grounded)
        {
            state = UnknownEnum.Value_138;
            stunned = 50;
            hsp = 0;
            vsp = 0;
            sprite_index = spr_grabbiehand_catch;
        }
        
        scr_collide();
        break;
    
    case UnknownEnum.Value_138:
        if (stunned > 0)
        {
            stunned--;
        }
        else if (grounded)
        {
            state = UnknownEnum.Value_7;
            sprite_index = spr_grabbiehand_idle;
            grounded = false;
        }
        
        if (grounded)
            hsp = 0;
        
        scr_collide();
        break;
    
    case UnknownEnum.Value_7:
        _dir = point_direction(x, y, xstart, ystart);
        x = Approach(x, xstart, abs(lengthdir_x(8, _dir)));
        y = Approach(y, ystart, abs(lengthdir_y(8, _dir)));
        
        if (x > (xstart - 8) && x < (xstart + 8) && y > (ystart - 8) && y < (ystart + 8))
        {
            state = UnknownEnum.Value_0;
            x = xstart;
            y = ystart;
        }
        
        break;
    
    case UnknownEnum.Value_55:
        sprite_index = spr_grabbiehand_catch;
        
        if (!reverse)
            vsp = -14;
        else
            vsp = 14;
        
        hsp = 0;
        
        with (playerid)
        {
            hsp = 0;
            vsp = 0;
            x = other.x;
            y = other.y;
            xscale = other.image_xscale;
            
            if (object_index != obj_pizzagoblinbomb)
            {
                state = UnknownEnum.Value_106;
                
                if (boxxed == false)
                    sprite_index = spr_player_catched;
                else
                    sprite_index = spr_boxxedpep_air;
            }
        }
        
        if (scr_solid(x, y - 1) || ((reverse && scr_solid(x, y + 1)) || place_meeting(x, y, obj_verticalhallway) || place_meeting(x, y, obj_hallway)))
        {
            if (playerid == obj_player1.id)
            {
                with (playerid)
                {
                    movespeed = tauntstoredmovespeed;
                    vsp = 0;
                    sprite_index = tauntstoredsprite;
                    state = tauntstoredstate;
                }
            }
            
            sprite_index = spr_grabbiehand_idle;
            state = UnknownEnum.Value_7;
            
            if (fake)
                instance_destroy();
        }
        
        scr_collide();
        break;
}

enum UnknownEnum
{
    Value_0,
    Value_7 = 7,
    Value_8,
    Value_55 = 55,
    Value_106 = 106,
    Value_135 = 135,
    Value_138 = 138
}
