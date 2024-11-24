if (picy == 640)
{
    if (!snickshotgun && global.SAGEshotgunsnick)
    {
        up = true;
        sprite = bg_SAGEsnickshotgun;
        snickshotgun = true;
        alarm[0] = 250;
        scr_soundeffect(sfx_collectgiantpizza);
    }
    else if (!dungeonbackup && global.SAGEdungeonbackup)
    {
        up = true;
        sprite = bg_SAGEdungeonbackup;
        dungeonbackup = true;
        alarm[0] = 250;
        scr_soundeffect(sfx_collectgiantpizza);
    }
    else if (!srank && global.SAGEsrank)
    {
        up = true;
        sprite = bg_SAGEsrank;
        srank = true;
        alarm[0] = 250;
        scr_soundeffect(sfx_collectgiantpizza);
    }
    else if (!snicksrank && global.SAGEsnicksrank)
    {
        up = true;
        sprite = bg_SAGEsnicksrank;
        snicksrank = true;
        alarm[0] = 250;
        scr_soundeffect(sfx_collectgiantpizza);
    }
    else if (!combo10 && global.SAGEcombo10)
    {
        up = true;
        sprite = bg_SAGEcombo10;
        combo10 = true;
        alarm[0] = 250;
        scr_soundeffect(sfx_collectgiantpizza);
    }
    else if (!secret && global.SAGEsecret)
    {
        up = true;
        sprite = bg_SAGEsecret;
        secret = true;
        alarm[0] = 250;
        scr_soundeffect(sfx_collectgiantpizza);
    }
    else if (!knight && global.SAGEknight)
    {
        up = true;
        sprite = bg_SAGEknight;
        knight = true;
        alarm[0] = 250;
        scr_soundeffect(sfx_collectgiantpizza);
    }
    else if (!toppin && global.SAGEtoppin)
    {
        up = true;
        sprite = bg_SAGEtoppin;
        toppin = true;
        alarm[0] = 250;
        scr_soundeffect(sfx_collectgiantpizza);
    }
    else if (!treasure && global.SAGEtreasure)
    {
        up = true;
        sprite = bg_SAGEtreasure;
        treasure = true;
        alarm[0] = 250;
        scr_soundeffect(sfx_collectgiantpizza);
    }
}

if (picy == 300)
    up = false;

if (up)
    picy -= 10;
