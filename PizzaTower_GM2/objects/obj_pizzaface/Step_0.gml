var playerid, dir;

playerid = 324;

if (obj_player1.spotlight == false)
    playerid = 323;

if (image_alpha == 1)
{
    dir = point_direction(x, y, playerid.x, playerid.y);
    x += lengthdir_x(maxspeed, dir);
    y += lengthdir_y(maxspeed, dir);
}
else
{
    image_alpha += 0.01;
}

if (place_meeting(x, y, playerid) && !playerid.cutscene && playerid.state != UnknownEnum.Value_146 && !instance_exists(obj_fadeout) && !instance_exists(obj_endlevelfade) && image_alpha == 1)
{
    if (instance_exists(obj_toppinwarrior))
    {
        if (variable_global_exists("toppinwarriorid1") && instance_exists(global.toppinwarriorid1))
            instance_destroy(global.toppinwarriorid1);
        else if (variable_global_exists("toppinwarriorid2") && instance_exists(global.toppinwarriorid2))
            instance_destroy(global.toppinwarriorid2);
        else if (variable_global_exists("toppinwarriorid3") && instance_exists(global.toppinwarriorid3))
            instance_destroy(global.toppinwarriorid3);
        else if (variable_global_exists("toppinwarriorid4") && instance_exists(global.toppinwarriorid4))
            instance_destroy(global.toppinwarriorid4);
        else if (variable_global_exists("toppinwarriorid5") && instance_exists(global.toppinwarriorid5))
            instance_destroy(global.toppinwarriorid5);
        
        instance_create(x, y, obj_flash);
        global.seconds = 59;
        obj_camera.alarm[1] = 60;
        obj_camera.ded = false;
        instance_destroy();
    }
    else if (!instance_exists(obj_toppinwarrior))
    {
        with (playerid)
        {
            instance_destroy(obj_fadeout);
            targetDoor = "A";
            room = timesuproom;
            state = UnknownEnum.Value_64;
            sprite_index = spr_Timesup;
            image_index = 0;
            audio_stop_all();
            scr_soundeffect(120);
        }
    }
    
    instance_destroy();
}

if (maxspeed < 3 && image_alpha == 1)
    maxspeed += 0.01;

enum UnknownEnum
{
    Value_64 = 64,
    Value_146 = 146
}
