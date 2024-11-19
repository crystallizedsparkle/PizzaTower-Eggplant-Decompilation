var spawnx, spawny, randompositionx, spawnxrandom;

if (obj_player1.spotlight == true)
    playerid = 324;
else
    playerid = 323;

spawn = true;

if (instance_number(obj_baddie) < 20)
{
    spawnx = playerid.x;
    spawny = playerid.y - 200;
    randompositionx = random_range(-500, 500);
    spawnxrandom = spawnx + randompositionx;
    objects[0] = 312;
    objects[1] = 311;
    objects[2] = 332;
    
    for (i = 0; i < 3; i += 1)
    {
        while (position_meeting(spawnxrandom + 50, spawny - 50, objects[i]) || position_meeting(spawnxrandom - 50, spawny - 50, objects[i]))
        {
            spawny += 1;
            
            if (spawnxrandom > playerid.x)
                spawnxrandom -= 1;
            
            if (spawnxrandom <= playerid.x)
                spawnxrandom += 1;
        }
        
        while (position_meeting(spawnxrandom + 50, spawny + 50, objects[i]) || position_meeting(spawnxrandom - 50, spawny + 50, objects[i]))
        {
            spawny -= 1;
            
            if (spawnxrandom > playerid.x)
                spawnxrandom -= 1;
            
            if (spawnxrandom <= playerid.x)
                spawnxrandom += 1;
        }
    }
    
    with (instance_create(clamp(spawnxrandom, 200, room_width - 200), spawny, choose(obj_swedishmonkey, obj_cheeseslime, obj_forknight, obj_pepgoblin, obj_fencer, obj_pizzagoblin, obj_ancho)))
    {
        instance_create(x, y, obj_pizzaportalfade);
        important = true;
        state = states.stun;
        stunned = 50;
    }
}

alarm[2] = 150;

enum UnknownEnum
{
    Value_138 = 138
}
