if (other.cutscene == false && other.state != UnknownEnum.Value_146 && state != UnknownEnum.Value_146 && other.state != UnknownEnum.Value_186 && state != UnknownEnum.Value_186)
{
    if (hurted == false && other.hurted == false && fightballadvantage == true && (state == UnknownEnum.Value_42 || state == UnknownEnum.Value_80) && (other.state == UnknownEnum.Value_42 || other.state == UnknownEnum.Value_80))
    {
        if (object_index == obj_player1)
        {
            obj_player1.state = UnknownEnum.Value_121;
            obj_player2.state = UnknownEnum.Value_4;
            obj_player2.xscale = xscale;
            obj_player1.depth = -7;
            obj_player2.depth = -6;
        }
        
        if (object_index == obj_player2)
        {
            obj_player2.state = UnknownEnum.Value_121;
            obj_player1.state = UnknownEnum.Value_4;
            obj_player1.xscale = xscale;
            obj_player1.depth = -6;
            obj_player2.depth = -7;
        }
        
        obj_player1.image_index = 0;
        obj_player2.image_index = 0;
        obj_player1.sprite_index = obj_player1.spr_fightball;
        obj_player2.sprite_index = obj_player2.spr_fightball;
        obj_player1.fightball = true;
        obj_player2.fightball = true;
    }
    
    with (obj_player2)
    {
        if (state == UnknownEnum.Value_42 && other.hurted == false && other.state != UnknownEnum.Value_107 && other.state != UnknownEnum.Value_38 && other.state != UnknownEnum.Value_47 && other.state != UnknownEnum.Value_5 && other.state != UnknownEnum.Value_9 && other.state != UnknownEnum.Value_51 && other.cutscene == false && other.hurted == false && hurted == false && !(other.state == UnknownEnum.Value_42 || other.state == UnknownEnum.Value_80))
        {
            movespeed = 0;
            image_index = 0;
            sprite_index = spr_haulingstart;
            baddiegrabbedID = other.id;
            state = UnknownEnum.Value_79;
            other.state = UnknownEnum.Value_4;
            obj_player1.depth = -6;
            obj_player2.depth = -7;
        }
        
        if (state == UnknownEnum.Value_108 && other.hurted == false && other.state != UnknownEnum.Value_59 && other.state != UnknownEnum.Value_107 && hurted == false)
        {
            scr_changetoppings();
            obj_player1.depth = -6;
            obj_player2.depth = -7;
            obj_player1.state = UnknownEnum.Value_59;
            obj_player1.sprite_index = obj_player1.spr_squished;
            obj_player1.image_index = 0;
        }
        
        if (other.state == UnknownEnum.Value_80 && hurted == false && other.hurted == false && !(state == UnknownEnum.Value_42 || state == UnknownEnum.Value_80))
        {
            xscale = -other.xscale;
            
            with (other)
                scr_pummel();
            
            obj_player1.depth = -7;
            obj_player2.depth = -6;
            thrown = true;
            instance_create(x, y, obj_slapstar);
            instance_create(x, y, obj_slapstar);
            instance_create(x, y, obj_slapstar);
            instance_create(x, y, obj_baddiegibs);
            instance_create(x, y, obj_baddiegibs);
            instance_create(x, y, obj_baddiegibs);
            
            with (obj_camera)
            {
                shake_mag = 3;
                shake_mag_acc = 3 / room_speed;
            }
            
            state = UnknownEnum.Value_107;
            x = obj_player1.x;
            y = obj_player1.y;
            alarm[8] = 60;
            alarm[7] = 120;
            movespeed = 15;
            vsp = -6;
            sprite_index = spr_hurt;
        }
    }
}

enum UnknownEnum
{
    Value_4 = 4,
    Value_5,
    Value_9 = 9,
    Value_38 = 38,
    Value_42 = 42,
    Value_47 = 47,
    Value_51 = 51,
    Value_59 = 59,
    Value_79 = 79,
    Value_80,
    Value_107 = 107,
    Value_108,
    Value_121 = 121,
    Value_146 = 146,
    Value_186 = 186
}
