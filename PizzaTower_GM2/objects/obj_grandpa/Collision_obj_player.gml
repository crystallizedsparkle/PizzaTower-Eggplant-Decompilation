with (obj_player)
{
    if (state == states.knightpep || state == states.knightpepslopes)
    {
        global.combotime = 60;
        instance_destroy(other);
    }
}

if (other.state != states.ghost)
{
    sprite_index = spr_grandpa_punch;
    image_index = 0;
    other.hurted = false;
    scr_hurtplayer(other);
}
else
{
    global.combotime = 60;
    instance_destroy();
}

enum UnknownEnum
{
    Value_16 = 16,
    Value_38 = 38,
    Value_47 = 47
}
