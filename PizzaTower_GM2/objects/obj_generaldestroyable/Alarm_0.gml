var i;

if (scr_solid(x, y))
{
    i = 0;
    
    while (scr_solid(x, y))
    {
        y--;
        i++;
        
        if (i > 128)
        {
            y = ystart;
            break;
        }
    }
}
