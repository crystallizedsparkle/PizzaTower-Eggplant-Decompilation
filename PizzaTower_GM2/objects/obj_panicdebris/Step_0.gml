if (global.panic && !start)
{
    alarm[0] = 5;
    start = true;
}

if (!global.panic)
    alarm[0] = -1;
