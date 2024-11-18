if (state != UnknownEnum.Value_206)
{
    obj_player1.brick = false;
    state = UnknownEnum.Value_206;
    sprite_index = spr_hamkuff_chain1;
    state = UnknownEnum.Value_206;
    
    with (instance_create(other.x, other.y, obj_brickcomeback))
    {
        trapped = true;
        baddieID = other.id;
        other.playerid = id;
    }
    
    instance_destroy(other, false);
}

enum UnknownEnum
{
    Value_206 = 206
}
