if (picy == 640)
{
    if (snickshotgun == false && global.SAGEshotgunsnick == true)
    {
        up = true;
        sprite = 2067;
        snickshotgun = true;
        alarm[0] = 250;
        scr_soundeffect(18);
    }
    else if (dungeonbackup == false && global.SAGEdungeonbackup == true)
    {
        up = true;
        sprite = 2068;
        dungeonbackup = true;
        alarm[0] = 250;
        scr_soundeffect(18);
    }
    else if (srank == false && global.SAGEsrank == true)
    {
        up = true;
        sprite = 2069;
        srank = true;
        alarm[0] = 250;
        scr_soundeffect(18);
    }
    else if (snicksrank == false && global.SAGEsnicksrank == true)
    {
        up = true;
        sprite = 2070;
        snicksrank = true;
        alarm[0] = 250;
        scr_soundeffect(18);
    }
    else if (combo10 == false && global.SAGEcombo10 == true)
    {
        up = true;
        sprite = 2071;
        combo10 = true;
        alarm[0] = 250;
        scr_soundeffect(18);
    }
    else if (secret == false && global.SAGEsecret == true)
    {
        up = true;
        sprite = 2072;
        secret = true;
        alarm[0] = 250;
        scr_soundeffect(18);
    }
    else if (knight == false && global.SAGEknight == true)
    {
        up = true;
        sprite = 2073;
        knight = true;
        alarm[0] = 250;
        scr_soundeffect(18);
    }
    else if (toppin == false && global.SAGEtoppin == true)
    {
        up = true;
        sprite = 2074;
        toppin = true;
        alarm[0] = 250;
        scr_soundeffect(18);
    }
    else if (treasure == false && global.SAGEtreasure == true)
    {
        up = true;
        sprite = 2075;
        treasure = true;
        alarm[0] = 250;
        scr_soundeffect(18);
    }
}

if (picy == 300)
    up = false;

if (up == true)
    picy -= 10;
