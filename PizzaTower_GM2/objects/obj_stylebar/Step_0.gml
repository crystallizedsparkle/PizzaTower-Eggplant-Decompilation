var pop, idle;

visible = obj_tv.visible;

switch (global.stylethreshold)
{
    case 0:
        pop = 2743;
        idle = 39;
        break;
    
    case 1:
        pop = 2792;
        idle = 2838;
        break;
    
    case 2:
        pop = 2411;
        idle = 2459;
        break;
    
    case 3:
        pop = 2373;
        idle = 1014;
        break;
}

if (global.style > 55 && global.stylethreshold < 3)
{
    global.stylethreshold += 1;
    global.style = global.style - 55;
    
    switch (global.stylethreshold)
    {
        case 0:
            pop = 2743;
            idle = 39;
            break;
        
        case 1:
            pop = 2792;
            idle = 2838;
            break;
        
        case 2:
            pop = 2411;
            idle = 2459;
            break;
        
        case 3:
            pop = 2373;
            idle = 1014;
            break;
    }
    
    index = 0;
    sprite = pop;
    scr_heatup();
}

if (global.style < 0 && global.stylethreshold != 0)
{
    global.stylethreshold -= 1;
    global.style = global.style + 55;
    
    switch (global.stylethreshold)
    {
        case 0:
            pop = 2743;
            idle = 39;
            break;
        
        case 1:
            pop = 2792;
            idle = 2838;
            break;
        
        case 2:
            pop = 2411;
            idle = 2459;
            break;
        
        case 3:
            pop = 2373;
            idle = 1014;
            break;
    }
    
    index = 0;
    sprite = pop;
    scr_heatdown();
}

if (sprite == pop && floor(index) == (sprite_get_number(sprite) - 1))
    sprite = idle;

if (global.style < 0 && global.stylethreshold == 0)
    global.style = 0;

if (global.stylethreshold == 3 && global.style > 55)
    global.style = 55;

visible = obj_tv.visible;

if (obj_player.y < 200)
    alpha = 0.3;
else if (!(room == rank_room || room == timesuproom || room == boss_room1 || room == Realtitlescreen || room == characterselect))
    alpha = 1;

index += 0.35;
global.stylemultiplier = (global.style + (global.stylethreshold * 55)) / 220;
