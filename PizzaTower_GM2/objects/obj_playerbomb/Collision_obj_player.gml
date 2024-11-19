if (!kick && countdown <= 0)
{
    other.vsp = -14;
    other.jumpstop = true;
    
    if (other.state == states.jump)
    {
        other.sprite_index = other.spr_stompprep;
        other.image_index = 0;
        other.jumpAnim = true;
    }
    
    countdown = 10;
    scr_soundeffect(24);
    create_particle(x, y, particles.jumpdust, 0);
}

enum UnknownEnum
{
    Value_5 = 5,
    Value_92 = 92
}
