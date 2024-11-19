var a, lowestdepth, i, b;

hsp = 0;
vsp = 0;
hsp_carry = 0;
vsp_carry = 0;
platformid = -4;
grav = 0.5;
grounded = false;
event_inherited();
monsterid = 2;
spr_dead = 2768;
spr_intro = 2507;
spr_introidle = 2736;
state = states.robot_idle;
inactivebuffer = 900;
xs = room_width / 2;
yy = -100;
substate = states.fall;
backgroundID = -4;
a = layer_get_all();
lowestdepth = 10000;

for (i = 0; i < array_length(a); i++)
{
    b = a[i];
    
    if (layer_get_element_type(b) == 1)
    {
        trace("layer background");
        
        if (layer_get_depth(b) < lowestdepth)
        {
            backgroundID = layer_background_get_id(b);
            lowestdepth = layer_get_depth(b);
            trace(lowestdepth);
        }
    }
}

trace(backgroundID);
trace(a);

enum UnknownEnum
{
    Value_135 = 135,
    Value_217 = 217
}
