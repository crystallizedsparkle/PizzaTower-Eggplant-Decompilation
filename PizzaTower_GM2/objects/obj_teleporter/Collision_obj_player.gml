if (player < 0)
{
    if (start == 1)
    {
        if (other.state != UnknownEnum.Value_84 && other.state != UnknownEnum.Value_61 && other.state != UnknownEnum.Value_137 && other.state != UnknownEnum.Value_186)
        {
            player = other.id;
            player.visible = false;
            storedstate = player.state;
            player.tauntstoredstate = player.state;
            storedmovespeed = player.movespeed;
            storedgrav = player.grav;
            storedimageindex = player.image_index;
            storedspriteindex = player.sprite_index;
            storedfreefallsmash = player.freefallsmash;
            
            repeat (8)
                create_particle(x + random_range(50, -50), y + random_range(50, -50), UnknownEnum.Value_11, 0);
            
            alarm[0] = 25;
            player.hsp = 0;
            player.vsp = 0;
            player.grav = 0;
            player.alarm[8] = 100;
            player.alarm[7] = 50;
            player.alarm[5] = 2;
            player.hurted = true;
            player.state = UnknownEnum.Value_84;
        }
    }
}

enum UnknownEnum
{
    Value_11 = 11,
    Value_61 = 61,
    Value_84 = 84,
    Value_137 = 137,
    Value_186 = 186
}
