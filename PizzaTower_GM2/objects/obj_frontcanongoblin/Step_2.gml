if (state != UnknownEnum.Value_8)
    captain_index += 0.35;
else
    captain_index += 0.6;

if (captain_index > sprite_get_number(captain_sprite))
    captain_index = 0 + frac(captain_index);

enum UnknownEnum
{
    Value_8 = 8
}
