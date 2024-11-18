function scr_player_handstandjump()
{
    var attackdash, airattackdash, airattackdashstart, _bump;
    
    landAnim = false;
    hsp = xscale * movespeed;
    move = key_left + key_right;
    momemtum = true;
    dir = xscale;
    
    if (global.attackstyle != 3)
    {
        if (movespeed < 10)
        {
            if ((sprite_index == spr_player_pistolshot || sprite_index == spr_shotgun_shot) && movespeed < 8)
                movespeed += 0.25;
            else if (sprite_index == spr_player_lunge && movespeed < 12)
                movespeed += 0.8;
            else if (movespeed < 10)
                movespeed += 0.5;
        }
    }
    else
    {
        if (movespeed < 10)
        {
            if ((sprite_index == spr_player_pistolshot || sprite_index == spr_shotgun_shot) && movespeed < 8)
                movespeed += 0.25;
            else if (movespeed < 10)
                movespeed += 0.5;
        }
        
        if (global.pummeltest && !instance_exists(lungeattackID))
        {
            with (instance_create(x, y, obj_lungehitbox))
            {
                playerid = other.id;
                other.lungeattackID = id;
            }
        }
    }
    
    if (shoot == true)
        attackdash = 1544;
    else
        attackdash = spr_suplexdash;
    
    if (sprite_index == spr_player_lungestart && floor(image_index) == (image_number - 1))
        sprite_index = spr_player_lunge;
    
    airattackdash = spr_suplexdashjump;
    airattackdashstart = spr_suplexdashjumpstart;
    
    if (global.attackstyle == 2)
        vsp = 0;
    
    if (!key_jump2 && jumpstop == false && vsp < 0.5 && stompAnim == false)
    {
        vsp /= 20;
        jumpstop = true;
    }
    
    if (key_jump && grounded && !key_down && global.attackstyle != 2)
    {
        jumpstop = false;
        image_index = 0;
        vsp = -11;
        state = UnknownEnum.Value_104;
        sprite_index = spr_player_longjump;
    }
    
    if (sprite_index == attackdash && !grounded)
    {
        image_index = 0;
        sprite_index = airattackdashstart;
    }
    
    if (grounded && sprite_index == airattackdash && (!key_attack || character == "N") && global.attackstyle != 2)
    {
        if (global.attackstyle != 3)
        {
            state = UnknownEnum.Value_0;
            
            if (move != xscale)
                movespeed = 2;
        }
        else
        {
            sprite_index = attackdash;
            image_index = image_number - 6;
        }
    }
    
    if (grounded && sprite_index == airattackdash && key_attack && character != "N" && global.attackstyle != 2)
        state = UnknownEnum.Value_104;
    
    if (floor(image_index) == (image_number - 1) && sprite_index == attackdash)
        state = UnknownEnum.Value_0;
    
    if (floor(image_index) == (image_number - 1) && sprite_index == airattackdashstart)
        sprite_index = airattackdash;
    
    if (floor(image_index) == (image_number - 1) && key_attack && sprite_index == attackdash)
    {
        image_speed = 0.35;
        state = UnknownEnum.Value_104;
        grav = 0.5;
    }
    
    if (key_down && grounded && global.attackstyle != 2)
    {
        with (instance_create(x, y, obj_jumpdust))
            image_xscale = other.xscale;
        
        movespeed = 12;
        crouchslipbuffer = 25;
        grav = 0.5;
        sprite_index = spr_player_Sjumpcancelland;
        image_index = 0;
        machhitAnim = false;
        state = UnknownEnum.Value_5;
    }
    
    mask_index = spr_player_mask;
    
    if ((!grounded && (place_meeting(x + hsp, y, obj_solid) || scr_solid_slope(x + hsp, y)) && !place_meeting(x + hsp, y, obj_destructibles)) || (grounded && (place_meeting(x + sign(hsp), y - 16, obj_solid) || scr_solid_slope(x + sign(hsp), y - 16)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_metalblock) && scr_slope()))
    {
        if (key_attack)
        {
            wallspeed = movespeed;
            
            if (vsp > 0)
                wallspeed -= vsp;
            
            state = UnknownEnum.Value_37;
        }
    }
    
    if ((grounded || !key_attack) && scr_solid(x + xscale, y) && !place_meeting(x + sign(hsp), y, obj_destructibles) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)))
    {
        _bump = ledge_bump((vsp >= 0) ? 32 : 22);
        
        if (_bump)
        {
            jumpstop = true;
            state = UnknownEnum.Value_92;
            vsp = -4;
            sprite_index = spr_suplexbump;
            instance_create(x + (xscale * 10), y + 10, obj_bumpeffect);
        }
    }
    
    if (!instance_exists(obj_slidecloud) && grounded && movespeed > 5)
    {
        with (instance_create(x, y, obj_slidecloud))
            image_xscale = other.xscale;
    }
    
    image_speed = 0.35;
    
    if (state != UnknownEnum.Value_106 && move != xscale && move != 0)
    {
        image_index = 0;
        
        if (!grounded)
        {
            sprite_index = spr_suplexcancel;
            jumpAnim = true;
            grav = 0.5;
            state = UnknownEnum.Value_92;
        }
        else
        {
            state = UnknownEnum.Value_0;
            movespeed = 2;
            grav = 0.5;
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_5 = 5,
    Value_37 = 37,
    Value_92 = 92,
    Value_104 = 104,
    Value_106 = 106
}