if (currentscore < maxscore && global.pigtotal >= maxscore && other.state == UnknownEnum.Value_0 && other.grounded && other.key_up2)
{
    ini_open(concat("saveData", global.currentsavefile, ".ini"));
    currentscore = maxscore;
    ini_write_real("StickScore", concat("world", world), maxscore);
    global.pigreduction = maxscore;
    ini_close();
}

enum UnknownEnum
{
    Value_0
}
