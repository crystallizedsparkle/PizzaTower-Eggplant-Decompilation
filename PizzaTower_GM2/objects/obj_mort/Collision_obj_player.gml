if (sprite_index != spr_mortspawn && sprite_index != spr_mortfall)
{
    with (other)
    {
        if (state != states.mort && state != states.mortjump && state != states.mortattack && state != states.morthook && state != states.ridecow)
        {
            repeat (6)
                create_debris(x, y, 1149);
            
            mort = true;
            instance_create_unique(x, y, 17);
            movespeed = hsp;
            state = states.mort;
            tv_push_prompt_once(tv_create_prompt("This is the mort powerup text", tvprompt_type.transformation, 2654, 3), "mort");
            instance_destroy(other);
        }
    }
}

enum UnknownEnum
{
    Value_2 = 2,
    Value_11 = 11,
    Value_12,
    Value_13,
    Value_14,
    Value_190 = 190
}
