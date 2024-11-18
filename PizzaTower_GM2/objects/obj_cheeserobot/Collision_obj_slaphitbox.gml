instance_create(x + (obj_player.xscale * 40), y, obj_punchdust);
state = UnknownEnum.Value_4;
obj_player.state = UnknownEnum.Value_79;
instance_destroy(other);
obj_player.suplexhavetomash = 5;
obj_player.sprite_index = spr_player_grab;

enum UnknownEnum
{
    Value_4 = 4,
    Value_79 = 79
}
