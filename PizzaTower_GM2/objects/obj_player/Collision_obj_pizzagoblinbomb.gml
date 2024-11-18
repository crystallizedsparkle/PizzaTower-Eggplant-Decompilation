if (!other.grabbable)
    exit;

if (state != UnknownEnum.Value_34)
{
    if (state == UnknownEnum.Value_42 || state == UnknownEnum.Value_43 || state == UnknownEnum.Value_80)
    {
        if (other.state == UnknownEnum.Value_0 && scr_transformationcheck() && !cutscene && state != UnknownEnum.Value_52 && (state == UnknownEnum.Value_42 || state == UnknownEnum.Value_80 || state == UnknownEnum.Value_43))
        {
            state = UnknownEnum.Value_52;
            image_index = 0;
            sprite_index = spr_haulingstart;
            other.defused = true;
            bombgrabID = other.id;
            movespeed = 6;
            
            with (other)
            {
                state = UnknownEnum.Value_4;
                playerid = other.id;
            }
            
            tv_push_prompt_once(tv_create_prompt("This is the bomb transformation text", UnknownEnum.Value_2, 2590, 3), "bombpep");
        }
    }
}
else if (other.kickbuffer <= 0)
{
    other.vsp = -9;
    other.movespeed = 7;
    other.image_xscale = xscale;
    other.kickbuffer = 15;
    other.y--;
    other.defused = true;
}

enum UnknownEnum
{
    Value_0,
    Value_2 = 2,
    Value_4 = 4,
    Value_34 = 34,
    Value_42 = 42,
    Value_43,
    Value_52 = 52,
    Value_80 = 80
}
