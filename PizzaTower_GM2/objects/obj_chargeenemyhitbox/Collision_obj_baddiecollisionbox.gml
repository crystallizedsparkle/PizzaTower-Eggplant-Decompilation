if (instance_exists(other.baddieID))
{
    if (!other.baddieID.elite || other.baddieID.elitehit <= 0)
    {
        if (other.baddieID != baddieID && !other.baddieID.invincible && other.baddieID.killbyenemy && other.baddieID.destroyable && other.baddieID.state != UnknownEnum.Value_4)
            instance_destroy(other.baddieID);
    }
}

enum UnknownEnum
{
    Value_4 = 4
}
