if (instance_exists(baddieID) && other.thrown)
{
    if (baddieID.destroyable)
    {
        instance_destroy();
        instance_destroy(baddieID);
    }
}
