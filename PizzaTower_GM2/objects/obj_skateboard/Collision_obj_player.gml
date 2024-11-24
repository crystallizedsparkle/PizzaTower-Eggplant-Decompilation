if (other.state != states.chainsaw && !other.skateboarding)
{
    instance_create(x, y, obj_genericpoofeffect);
    other.movespeed = 10;
    other.state = states.mach2;
    other.skateboarding = true;
    tv_push_prompt_once(tv_create_prompt("This is the clown transformation text", tvprompt_type.transformation, spr_tv_clown, 3), "skateboard");
}

