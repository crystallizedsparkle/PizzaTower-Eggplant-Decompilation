var my_player;

my_player = obj_player1.id;

if (player_id == 2)
    my_player = obj_player2.id;

if (my_player.state != states.handstandjump && my_player.flash == false && my_player.state != states.parry)
    instance_destroy();

image_xscale = my_player.xscale;
x = my_player.x;
y = my_player.y;

enum UnknownEnum
{
    Value_42 = 42,
    Value_147 = 147
}
