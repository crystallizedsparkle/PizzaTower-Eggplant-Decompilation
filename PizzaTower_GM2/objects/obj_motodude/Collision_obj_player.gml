if (other.instakillmove)
{
    instance_destroy();
}
else if (other.state == UnknownEnum.Value_108)
{
    other.xscale = sign(image_xscale);
    other.state = UnknownEnum.Value_32;
    other.movespeed = abs(hsp);
    other.sprite_index = spr_player_pizzacar;
    explode = false;
    instance_destroy();
}
else
{
    instance_destroy();
    scr_hurtplayer(other);
}

enum UnknownEnum
{
    Value_32 = 32,
    Value_108 = 108
}
