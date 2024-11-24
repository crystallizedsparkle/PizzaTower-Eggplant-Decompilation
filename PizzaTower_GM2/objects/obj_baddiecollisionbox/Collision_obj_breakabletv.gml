if (instance_exists(baddieID) && other.thrown && !baddieID.instantkillable)
{
    instance_destroy(other);
    instance_destroy();
    instance_destroy(baddieID);
}
