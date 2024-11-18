function scr_enemy_hit()
{
    var _player, _hp;
    
    x = hitX + random_range(-6, 6);
    y = hitY + random_range(-6, 6);
    hitLag--;
    sprite_index = stunfallspr;
    
    if (hitLag <= 0)
    {
        x = hitX;
        y = hitY;
        _player = -4;
        
        if (grabbedby == 1)
            _player = 324;
        else
            _player = 323;
        
        if (obj_player.tauntstoredstate == UnknownEnum.Value_104 || obj_player.tauntstoredstate == UnknownEnum.Value_5 || obj_player.state == UnknownEnum.Value_104 || obj_player.state == UnknownEnum.Value_5)
            thrown = false;
        else
            thrown = true;
        
        vsp = hitvsp;
        hsp = hithsp;
        global.hit += 1;
        
        if (other.object_index == obj_pizzaball)
            global.golfhit += 1;
        
        global.combotime = 60;
        global.heattime = 60;
        alarm[1] = 5;
        _hp = 0;
        
        if ((global.attackstyle == 3 || global.attackstyle == 0) && !global.kungfu)
            _hp = -1;
        
        if (((!elite && (hp <= _hp || mach3destroy)) || (elite && elitehit <= 0 && mach3destroy)) && object_get_parent(object_index) != 16 && destroyable)
        {
            instance_destroy();
            instance_create(x, y, obj_genericpoofeffect);
        }
        
        stunned = 200;
        state = UnknownEnum.Value_138;
    }
}

enum UnknownEnum
{
    Value_5 = 5,
    Value_104 = 104,
    Value_138 = 138
}
