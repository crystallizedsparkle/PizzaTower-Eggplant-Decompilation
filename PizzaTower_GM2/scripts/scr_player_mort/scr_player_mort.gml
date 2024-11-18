function scr_player_mort()
{
    move = key_right + key_left;
    hsp = movespeed;
    mort = false;
    doublejump = false;
    jumpstop = false;
    
    if (key_jump)
        input_buffer_jump = 0;
    
    if (move != 0)
    {
        if (move == xscale)
            movespeed = Approach(movespeed, xscale * 8, 0.8);
        else
            movespeed = Approach(movespeed, 0, 0.8);
        
        if (movespeed <= 0)
            xscale = move;
    }
    else
    {
        movespeed = Approach(movespeed, 0, 0.8);
    }
    
    if (movespeed < 3 && move != 0)
        image_speed = 0.35;
    else if (movespeed > 3 && movespeed < 6)
        image_speed = 0.45;
    else
        image_speed = 0.6;
    
    if (place_meeting(x + sign(hsp), y, obj_solid) && !place_meeting(x + sign(hsp), y, obj_slope))
    {
        movespeed = 0;
        
        if (sprite_index == spr_player_barrelmove)
            sprite_index = spr_player_barrelidle;
    }
    
    if (!landAnim)
    {
        if (move != 0)
        {
            sprite_index = spr_player_mortwalk;
        }
        else
        {
            sprite_index = spr_player_mortidle;
            image_speed = 0.35;
        }
    }
    else if (floor(image_index) == (image_number - 1))
    {
        landAnim = false;
        
        if (move != 0)
            sprite_index = spr_player_mortwalk;
        else
            sprite_index = spr_player_mortidle;
    }
    
    if (!grounded)
    {
        state = UnknownEnum.Value_12;
        sprite_index = spr_player_mortjump;
    }
    else if (input_buffer_jump < 8)
    {
        input_buffer_jump = 0;
        state = UnknownEnum.Value_12;
        doublejump = false;
        vsp = -11;
        sprite_index = spr_player_mortjumpstart;
        image_index = 0;
        scr_soundeffect(12);
        create_particle(x, y, UnknownEnum.Value_5, 0);
    }
    
    mort_attack();
}

function mort_attack()
{
    var _angle;
    
    if (key_slap2)
    {
        state = UnknownEnum.Value_13;
        sprite_index = spr_player_mortattackfront;
        image_index = 0;
        
        if (move != 0)
            xscale = move;
        
        _angle = 0;
        
        if (key_up)
        {
            _angle = 90;
            sprite_index = spr_player_mortattackup;
        }
        else if (key_down && !grounded)
        {
            if (!grounded)
                vsp = 3;
            
            _angle = 270;
            sprite_index = spr_player_mortattackdown;
        }
        else
        {
            movespeed = xscale * 12;
        }
        
        with (instance_create(x, y, obj_morthitbox))
        {
            playerid = other.id;
            
            if (_angle == 0)
                image_xscale = other.xscale;
            
            image_angle = _angle;
            alarm[0] = 15;
        }
    }
    
    if (sprite_index == spr_player_mortattackdown || sprite_index == spr_player_mortattackup || sprite_index == spr_player_mortattack)
    {
        if (punch_afterimage > 0)
        {
            punch_afterimage--;
        }
        else
        {
            punch_afterimage = 5;
            create_blue_afterimage(x, y, sprite_index, image_index, xscale);
        }
    }
}

function Mort_DownMovement()
{
    if (image_angle == 270)
    {
        with (playerid)
        {
            doublejump = false;
            vsp = -14;
        }
    }
}

enum UnknownEnum
{
    Value_5 = 5,
    Value_12 = 12,
    Value_13
}