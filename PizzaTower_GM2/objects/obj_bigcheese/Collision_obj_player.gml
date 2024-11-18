if (state != UnknownEnum.Value_74)
{
    pizzaball = false;
    playerid = other.id;
    shot = false;
    state = UnknownEnum.Value_74;
    sprite_index = spr_bigcheese_walk;
    image_index = 0;
    other.state = UnknownEnum.Value_5;
    other.sprite_index = other.spr_tumble;
}

enum UnknownEnum
{
    Value_5 = 5,
    Value_74 = 74
}
