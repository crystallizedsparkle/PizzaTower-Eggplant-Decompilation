with (other)
{
    if (vsp < 0)
    {
        repeat (2)
            create_debris(x, y + 43, 2814);
        
        vsp *= 0.5;
        audio_stop_sound(sfx_cheesejump);
        audio_stop_sound(sfx_jump);
        scr_soundeffect(0);
    }
    
    if (state == UnknownEnum.Value_37)
        state = grounded ? UnknownEnum.Value_0 : UnknownEnum.Value_92;
    
    if (hsp != 0 && (floor(image_index) % 4) == 0)
    {
        create_debris(x, y + 43, 2814);
        
        if (!other.stepped)
        {
            scr_soundeffect(56);
            other.stepped = true;
            other.alarm[0] = 8;
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_37 = 37,
    Value_92 = 92
}
