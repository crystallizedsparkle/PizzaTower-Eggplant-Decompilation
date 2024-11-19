with (other)
{
    if (state != states.rocket && state != states.actor && state != states.rocketslide && state != states.gotoplayer)
    {
        xscale = other.image_xscale;
        state = states.rocket;
        tv_push_prompt_once(tv_create_prompt("This is the rocket transformation text", tvprompt_type.transformation, 135, 3), "rocket");
        sprite_index = spr_rocketstart;
        image_index = 0;
        
        if (movespeed < 8)
            movespeed = 8;
        
        x = other.x;
        y = other.y + 4;
    }
}

enum UnknownEnum
{
    Value_2 = 2,
    Value_146 = 146,
    Value_184 = 184,
    Value_185,
    Value_186
}
