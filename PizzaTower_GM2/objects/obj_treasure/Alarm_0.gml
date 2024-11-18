var p;

p = -4;

if (player == 1)
    p = obj_player1.id;
else if (player == 2)
    p = obj_player2.id;

p.state = UnknownEnum.Value_0;

enum UnknownEnum
{
    Value_0
}
