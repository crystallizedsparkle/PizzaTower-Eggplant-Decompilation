if (hurted == true && hurtfx == false)
{
    repeat (4)
    {
        with (create_debris(x + random_range(0, 64), y + random_range(0, 64), 1253))
        {
            hsp = random_range(-5, 5);
            vsp = random_range(-10, 10);
        }
    }
    
    repeat (3)
    {
        with (instance_create(x + random_range(0, 64), y + random_range(0, 64), obj_parryeffect))
        {
            sprite_index = spr_deadjohnsmoke;
            image_speed = 0.35;
        }
    }
    
    hurtfx = true;
}

if (flash == true && alarm[1] <= 0)
    alarm[1] = 0.15 * room_speed;

if (hurted == true)
    hurtx = random_range(2, -2);