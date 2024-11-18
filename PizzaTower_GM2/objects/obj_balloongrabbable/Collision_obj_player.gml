if (active)
{
    if (other.isgustavo && other.brick)
    {
        other.state = UnknownEnum.Value_200;
        active = false;
        cooldown = 100;
        other.balloonbuffer = 250;
    }
    else if (other.isgustavo == false)
    {
        other.state = UnknownEnum.Value_207;
        other.movespeed = other.hsp;
        active = false;
        
        with (other)
        {
            if (isgustavo)
                vsp = -7;
        }
        
        cooldown = 100;
        other.balloonbuffer = 250;
    }
}

enum UnknownEnum
{
    Value_200 = 200,
    Value_207 = 207
}
