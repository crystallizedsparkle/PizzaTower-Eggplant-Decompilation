with (other)
{
    if (state == UnknownEnum.Value_42 || state == UnknownEnum.Value_43 || state == UnknownEnum.Value_80)
    {
        image_index = 0;
        sprite_index = spr_shotgunpullout;
        scr_soundeffect(88);
        instance_destroy(other);
        shotgunAnim = true;
        state = UnknownEnum.Value_66;
        tv_push_prompt_once(tv_create_prompt("This is the shotgun powerup text", UnknownEnum.Value_2, 334, 3), "shotgun");
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
