if (parryable && other.state == UnknownEnum.Value_84 && other.parry_inst != -4)
    exit;

player_hurt(dmg, other.id);

enum UnknownEnum
{
    Value_84 = 84
}
