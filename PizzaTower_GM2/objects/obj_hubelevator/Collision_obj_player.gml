if (state != UnknownEnum.Value_18 && other.grounded && other.key_up2)
{
    if (other.isgustavo)
        isgustavo = true;
    else
        isgustavo = false;
    
    state = UnknownEnum.Value_18;
    playerid = other.id;
    other.state = UnknownEnum.Value_146;
    other.key_up2 = false;
    other.movespeed = 0;
    other.hsp = 0;
    other.sprite_index = other.spr_idle;
    other.image_speed = 0.35;
}

enum UnknownEnum
{
    Value_18 = 18,
    Value_146 = 146
}
