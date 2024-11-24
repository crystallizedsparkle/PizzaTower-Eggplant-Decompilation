if (instance_exists(baddieID) && other.thrown)
{
    instance_destroy();
    instance_destroy(baddieID);
}
