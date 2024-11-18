if (state != UnknownEnum.Value_74 && (other.hsp != 0 || other.thrown || other.state == UnknownEnum.Value_5))
{
    pizzaball = true;
    golfid = other.id;
    shot = false;
    state = UnknownEnum.Value_74;
    sprite_index = spr_bigcheese_walk;
    image_index = 0;
}

enum UnknownEnum
{
    Value_5 = 5,
    Value_74 = 74
}
