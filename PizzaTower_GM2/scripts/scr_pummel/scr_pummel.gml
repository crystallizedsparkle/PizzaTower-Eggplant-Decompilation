function scr_pummel()
{
    sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch);
    image_index = 0;
    state = UnknownEnum.Value_91;
    movespeed = 3;
    vsp = -3;
}

enum UnknownEnum
{
    Value_91 = 91
}