function scr_pizzaball_thrown()
{
    if (stuntouchbuffer > 0)
        stuntouchbuffer--;
    
    switch (substate)
    {
        case UnknownEnum.Value_156:
            image_speed = 0.5;
            
            if (sprite_index != spr_pizzaball_hitwall && sprite_index != spr_pizzaball_hitwall2)
                sprite_index = spr_pizzaball_roll;
            else if (floor(image_index) == (image_number - 1))
                sprite_index = spr_pizzaball_roll;
            
            hsp = image_xscale * hitspeed;
            
            if (grounded && vsp > 0)
            {
                if (!bounced)
                {
                    sprite_index = spr_pizzaball_hitwall2;
                    image_index = 0;
                    hitspeed *= 0.8;
                    jumpspeed *= 0.25;
                    vsp = -jumpspeed;
                    bounced = true;
                }
                else
                {
                    substate = UnknownEnum.Value_100;
                }
            }
            
            if (scr_solid(x + hsp, y) && !place_meeting(x + hsp, y, obj_slope) && !place_meeting(x + hsp, y, obj_destructibles))
            {
                sprite_index = spr_pizzaball_hitwall;
                image_index = 0;
                image_xscale *= -1;
                hitspeed *= 0.5;
            }
            
            break;
        
        case UnknownEnum.Value_100:
            sprite_index = spr_pizzaball_roll;
            hitspeed = Approach(hitspeed, 0, 0.2);
            hsp = image_xscale * hitspeed;
            
            if (scr_solid(x + hsp, y) && !place_meeting(x + hsp, y, obj_slope) && !place_meeting(x + hsp, y, obj_destructibles))
                image_xscale *= -1;
            
            if (hitspeed == 0)
            {
                sprite_index = walkspr;
                state = UnknownEnum.Value_134;
            }
            
            break;
    }
}

enum UnknownEnum
{
    Value_100 = 100,
    Value_134 = 134,
    Value_156 = 156
}
