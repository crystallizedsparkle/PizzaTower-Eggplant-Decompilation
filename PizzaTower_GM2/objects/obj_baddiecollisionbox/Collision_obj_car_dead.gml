if (instance_exists(baddieID) && other.thrown && baddieID.destroyable)
{
    instance_destroy();
    instance_destroy(baddieID);
}
