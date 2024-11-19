with (other)
{
    if (state != states.gotoplayer)
    {
        if (state == states.bombpepside || state == states.motorcycle || state == states.slipnslide || state == states.rocket || state == states.grind || state == states.tumble || state == states.cheeseball || state == states.knightpepslopes || state == states.machroll || state == states.mach3 || state == states.mach2)
        {
            other.sprite_index = spr_sidespringblock_bounce;
            other.image_index = 0;
            
            if (xscale != other.image_xscale)
                xscale = other.image_xscale;
        }
    }
}

enum UnknownEnum
{
    Value_5 = 5,
    Value_21 = 21,
    Value_32 = 32,
    Value_38 = 38,
    Value_53 = 53,
    Value_65 = 65,
    Value_78 = 78,
    Value_94 = 94,
    Value_104 = 104,
    Value_121 = 121,
    Value_184 = 184,
    Value_186 = 186
}
