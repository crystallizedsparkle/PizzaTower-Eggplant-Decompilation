if (!graffiti && other.state == UnknownEnum.Value_84 && global.graffiticutscene)
{
    other.state = UnknownEnum.Value_85;
    other.sprite_index = other.spr_victory;
    other.image_index = 0;
    global.factorygraffiti = true;
    graffiti = true;
    quick_ini_write_real(get_savefile_ini(), "cutscene", "factorygraffiti", true);
}

enum UnknownEnum
{
    Value_84 = 84,
    Value_85
}
