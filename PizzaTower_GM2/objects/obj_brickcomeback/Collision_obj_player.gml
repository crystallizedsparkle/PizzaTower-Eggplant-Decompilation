if (!trapped)
{
    if (comeback == true)
    {
        other.brick = true;
        
        if (other.state != UnknownEnum.Value_260 && other.state != states.backbreaker)
        {
            if (!other.grounded)
                other.sprite_index = spr_player_ratmountfall;
            else
                other.sprite_index = spr_player_ratmountidle;
        }
        
        instance_create(other.x, other.y, obj_genericpoofeffect);
        instance_destroy();
    }
}
else if (other.state == UnknownEnum.Value_259 && baddieID == -4)
{
    scr_soundeffect(46);
    vsp = -6;
    hsp = other.xscale * 8;
    trapped = false;
    wait = true;
    comeback = false;
    alarm[0] = 30;
}

enum UnknownEnum
{
    Value_84 = 84,
    Value_259 = 259,
    Value_260
}
