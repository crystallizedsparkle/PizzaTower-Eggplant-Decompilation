instance_create(x + (obj_player1.xscale * 40), y, obj_punchdust);

with (obj_player)
{
    image_index = 0;
    sprite_index = spr_player_haulingstart;
    
    if (other.heavy == true)
        heavy = true;
    else
        heavy = false;
    
    state = UnknownEnum.Value_79;
}

state = UnknownEnum.Value_4;
instance_destroy(other);

enum UnknownEnum
{
    Value_4 = 4,
    Value_79 = 79
}
