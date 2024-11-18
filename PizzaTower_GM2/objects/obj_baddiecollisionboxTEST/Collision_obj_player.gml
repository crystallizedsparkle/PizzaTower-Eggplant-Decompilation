var _playerinst;

if (baddieID.state != UnknownEnum.Value_4 && baddieID.state != UnknownEnum.Value_154)
{
    _playerinst = other.id;
    baddiecollisionbox_update(_playerinst);
}

enum UnknownEnum
{
    Value_4 = 4,
    Value_154 = 154
}
