var t;

if (room == hub_loadingscreen && state != 2 && !instance_exists(obj_fadeout))
{
    with (obj_player)
    {
        targetRoom = 229;
        targetDoor = "D";
        targetRoom = 69;
        targetDoor = "A";
    }
    
    instance_create(x, y, obj_fadeout);
}

if (state != 0)
{
    showicon = true;
    icon_alpha = 3;
}
else if (showicon)
{
    icon_alpha = Approach(icon_alpha, 0, 0.05);
    
    if (icon_alpha <= 0)
        showicon = false;
}

if (showicon)
{
    icon_index += 0.35;
    
    if (icon_index > (icon_max - 1))
    {
        t = frac(icon_index);
        icon_index = t;
    }
}
