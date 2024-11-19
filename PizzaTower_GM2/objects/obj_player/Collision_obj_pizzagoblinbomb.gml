if (!other.grabbable)
    exit;

if (state != states.boxxedpepspin)
{
    if (state == states.handstandjump || state == states.lungeattack || state == states.punch)
    {
        if (other.state == states.normal && scr_transformationcheck() && !cutscene && state != states.bombgrab && (state == states.handstandjump || state == states.punch || state == states.lungeattack))
        {
            state = states.bombgrab;
            image_index = 0;
            sprite_index = spr_haulingstart;
            other.defused = true;
            bombgrabID = other.id;
            movespeed = 6;
            
            with (other)
            {
                state = states.grabbed;
                playerid = other.id;
            }
            
            tv_push_prompt_once(tv_create_prompt("This is the bomb transformation text", tvprompt_type.transformation, 2590, 3), "bombpep");
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
