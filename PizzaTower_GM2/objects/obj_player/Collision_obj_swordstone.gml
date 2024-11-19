if (grounded && other.sprite_index == spr_swordstone && (state == states.handstandjump || state == states.punch || state == states.lungeattack))
{
    transformationlives = 3;
    scr_soundeffect(77);
    global.SAGEknighttaken = true;
    momentum = false;
    movespeed = 0;
    other.image_index = 1;
    image_index = 0;
    image_speed = 0.35;
    sprite_index = spr_knightpepstart;
    state = states.knightpep;
    hsp = 0;
    vsp = 0;
    tv_push_prompt_once(tv_create_prompt("This is the knight transformation text", tvprompt_type.touch_trigger, 596, 3), "knight");
}

enum UnknownEnum
{
    Value_2 = 2,
    Value_42 = 42,
    Value_43,
    Value_47 = 47,
    Value_80 = 80
}
