var _player;

if (state != UnknownEnum.Value_4)
{
    _player = (grabbedby == 1) ? obj_player1.id : obj_player2.id;
    x = _player.x;
    y = _player.y;
}

enum UnknownEnum
{
    Value_4 = 4
}
