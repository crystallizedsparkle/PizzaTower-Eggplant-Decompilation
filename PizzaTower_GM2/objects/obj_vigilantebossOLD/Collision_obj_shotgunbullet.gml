event_inherited();

if (state == UnknownEnum.Value_160)
{
    boss_hurt_noplayer(350);
    targetstunned = 100;
    hithsp = 0;
    hitvsp = 0;
    hitLag = 20;
    hitstate = UnknownEnum.Value_160;
    
    if (hp <= 0)
    {
        hitstate = UnknownEnum.Value_0;
        boss_destroy(lastplayerid);
        hitX = floor(room_width - (room_width / 2.5));
        lastplayerid.hitX = floor(room_width / 2.5);
        lastplayerid.sprite_index = spr_player_pistolshotend;
        lastplayerid.image_index = 0;
        instance_destroy(other);
    }
    
    duel_buffer = duel_max + irandom(duel_random);
}

enum UnknownEnum
{
    Value_0,
    Value_160 = 160
}
