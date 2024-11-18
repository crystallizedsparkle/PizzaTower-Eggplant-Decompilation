trigger = 6;

func = function(argument0)
{
    if (!active)
    {
        if (following_has_follower(786))
        {
            active = true;
            instance_destroy(obj_alienfollow);
        }
    }
};
