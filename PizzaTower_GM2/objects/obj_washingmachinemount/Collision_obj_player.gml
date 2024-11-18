if (other.y < y && visible == true)
{
    other.image_index = 0;
    other.sprite_index = spr_playerN_hookshot1;
    other.state = UnknownEnum.Value_19;
    visible = false;
}

enum UnknownEnum
{
    Value_19 = 19
}
