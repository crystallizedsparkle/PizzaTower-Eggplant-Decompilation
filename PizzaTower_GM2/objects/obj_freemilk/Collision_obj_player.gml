with (other)
{
    if (state == UnknownEnum.Value_10 && sprite_index == spr_firemouth)
    {
        sprite_index = spr_firemouthend;
        image_index = 0;
        other.sprite_index = spr_freemilksuprised;
        other.image_index = 0;
    }
}

if (sprite_index == spr_freemilksuprised && floor(image_index) == (image_number - 1))
    sprite_index = spr_freemilk;

enum UnknownEnum
{
    Value_10 = 10
}
