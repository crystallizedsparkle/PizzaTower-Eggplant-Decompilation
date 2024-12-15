trigger = 6;

func = function(_inst)
{
    if (!active)
    {
        if (following_has_follower(obj_alienfollow))
        {
            active = true;
            instance_destroy(obj_alienfollow);
        }
    }
};
