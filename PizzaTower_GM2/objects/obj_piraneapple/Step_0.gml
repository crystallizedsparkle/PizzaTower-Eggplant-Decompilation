var targetplayer;

if (room == rm_editor)
    exit;

switch (state)
{
    case UnknownEnum.Value_134:
        targetplayer = obj_player1.id;
        
        if (hamspotted == true)
            targetplayer = 818;
        
        if ((targetplayer.x > x && image_xscale < 0) || (targetplayer.x < x && image_xscale > 0))
        {
            movespeed = Approach(movespeed, 0, 0.5);
            
            if (movespeed <= 0)
            {
                movespeed = 0;
                
                if (targetplayer.x != x)
                    image_xscale = sign(targetplayer.x - x);
                else
                    image_xscale *= -1;
            }
        }
        else if (movespeed < 18)
        {
            movespeed += 1;
        }
        
        hsp = image_xscale * movespeed;
        
        if (grounded && vsp > 0)
            vsp = -5;
        
        if (instance_exists(obj_ham))
        {
            if (hamspotted == false && (obj_ham.x > (x - 400) && obj_ham.x < (x + 400)) && (y <= (obj_ham.y + 20) && y >= (obj_ham.y - 20)))
                hamspotted = true;
        }
        
        if (flash == true && alarm[2] <= 0)
            alarm[2] = 0.05 * room_speed;
        
        if (hitboxcreate == false)
        {
            with (instance_create(x, y, obj_forkhitbox))
            {
                ID = other.id;
                image_xscale = other.image_xscale;
                sprite_index = other.sprite_index;
                mask_index = other.mask_index;
                other.hitboxcreate = true;
            }
        }
        
        scr_collide();
        break;
    
    case UnknownEnum.Value_8:
        flash = false;
        sprite_index = spr_piraneapplewater;
        
        if (place_meeting(x, y, obj_solid))
        {
            vsp = -11;
            y += vsp;
        }
        else
        {
            if (grounded)
            {
                state = UnknownEnum.Value_134;
                sprite_index = spr_piraneappleattack;
            }
            
            scr_collide();
        }
        
        break;
}

enum UnknownEnum
{
    Value_8 = 8,
    Value_134 = 134
}