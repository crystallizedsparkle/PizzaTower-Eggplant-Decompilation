image_speed = 0.35;

switch (state)
{
    case UnknownEnum.Value_0:
        sprite_index = spr_sirnose_idle;
        
        if (cooldown > 0)
        {
            cooldown--;
        }
        else
        {
            with (obj_pizzaball)
            {
                if (state != UnknownEnum.Value_148 && distance_to_pos(x, y, other.x, other.y, 200, 150))
                {
                    state = UnknownEnum.Value_264;
                    other.state = UnknownEnum.Value_264;
                    other.hsp = hsp;
                    other.vsp = vsp;
                    other.ballID = id;
                }
            }
        }
        
        break;
    
    case UnknownEnum.Value_264:
        with (ballID)
        {
            depth = 0;
            sprite_index = spr_pizzaball_roll;
            sit = false;
            x = Approach(x, other.x, 8);
            y = Approach(y, other.y, 8);
            
            if (state != UnknownEnum.Value_148)
            {
                other.hsp = Approach(hsp, 0, 1);
                other.vsp = Approach(vsp, 0, 1);
            }
            else
            {
                sprite_index = spr_pizzaball_stun;
            }
            
            hsp = other.hsp;
            vsp = other.vsp;
            
            if (state != UnknownEnum.Value_264 && state != UnknownEnum.Value_148)
            {
                other.state = UnknownEnum.Value_0;
                other.cooldown = 200;
            }
            
            if (x != other.x || y != other.y)
            {
                if (x != other.x)
                    other.image_xscale = sign(other.x - x);
                
                other.sprite_index = spr_sirnose_suck;
            }
            else
            {
                other.sprite_index = spr_sirnose_idle;
            }
        }
        
        break;
}

enum UnknownEnum
{
    Value_0,
    Value_148 = 148,
    Value_264 = 264
}