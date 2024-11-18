var changecoord;

with (other)
{
    if (state != UnknownEnum.Value_186 && state != UnknownEnum.Value_146)
    {
        changecoord = true;
        
        if (place_meeting(x, y, obj_superspring))
            changecoord = false;
        
        if (changecoord)
            y = other.y - 14;
        
        vsp = 0;
        create_particle(x, y, UnknownEnum.Value_5, 0);
        
        if (boxxed == false && isgustavo == false)
        {
            if (character == "P")
            {
                if (sprite_index != spr_dashpadmach)
                {
                    sprite_index = spr_dashpadmach;
                    image_index = 0;
                }
            }
            else if (character == "N")
            {
                if (sprite_index != spr_crazyrun)
                {
                    sprite_index = spr_crazyrun;
                    image_index = 0;
                }
            }
            
            machhitAnim = false;
            state = UnknownEnum.Value_121;
            xscale = sign(other.image_xscale);
            
            if (movespeed < 14)
            {
                movespeed = 14;
                hsp = xscale * movespeed;
            }
            else
            {
                movespeed += 0.5;
                hsp = xscale * movespeed;
            }
        }
        else
        {
            xscale = sign(other.image_xscale);
            
            if (boxxed)
            {
                boxxeddash = true;
                
                if (abs(movespeed) < 14)
                    movespeed = xscale * 14;
                else
                    movespeed += (xscale * 0.5);
                
                sprite_index = spr_boxxedpepwalk;
                state = UnknownEnum.Value_33;
            }
            
            if (isgustavo)
            {
                ratmount_movespeed = 12;
                gustavodash = 51;
                state = UnknownEnum.Value_191;
                
                if (abs(movespeed) < 12)
                    movespeed = other.image_xscale * 12;
            }
        }
    }
}

enum UnknownEnum
{
    Value_5 = 5,
    Value_33 = 33,
    Value_121 = 121,
    Value_146 = 146,
    Value_186 = 186,
    Value_191 = 191
}
