with (other)
{
    if (state == states.handstandjump || state == states.lungeattack || state == states.punch)
    {
        image_index = 0;
        sprite_index = spr_shotgunpullout;
        scr_soundeffect(88);
        instance_destroy(other);
        shotgunAnim = true;
        state = states.shotgun;
        tv_push_prompt_once(tv_create_prompt("This is the shotgun powerup text", tvprompt_type.transformation, 334, 3), "shotgun");
        global.heattime = 60;
    }
}

enum UnknownEnum
{
    Value_2 = 2,
    Value_42 = 42,
    Value_43,
    Value_66 = 66,
    Value_80 = 80
}
