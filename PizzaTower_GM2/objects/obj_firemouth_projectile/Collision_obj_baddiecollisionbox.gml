with (other)
{
    if (instance_exists(baddieID) && baddieID.state != UnknownEnum.Value_4 && baddieID.object_index != obj_tank && !baddieID.invincible)
    {
        instance_destroy();
        instance_destroy(baddieID);
    }
}

instance_destroy();

enum UnknownEnum
{
    Value_4 = 4
}