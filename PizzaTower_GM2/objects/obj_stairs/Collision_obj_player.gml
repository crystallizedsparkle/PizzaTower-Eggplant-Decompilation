with (other)
{
    if (key_up && ladderbuffer == 0 && (state == states.normal || state == states.pogo || state == states.mach2 || state == states.mach3 || state == states.mach1 || state == states.shotgunjump || state == states.jump || state == states.highjump) && state != states.hurt && state != states.machslide && state != states.freefall && state != states.freefallland)
    {
        mach2 = 0;
        state = states.ladder;
        y = floor(y);
        
        if ((y % 2) == 1)
            y -= 1;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_57 = 57,
    Value_58,
    Value_60 = 60,
    Value_92 = 92,
    Value_93,
    Value_103 = 103,
    Value_104,
    Value_105,
    Value_107 = 107,
    Value_108,
    Value_111 = 111,
    Value_121 = 121
}
