if (other.instakillmove || other.state == UnknownEnum.Value_42)
{
    with (other)
    {
        scr_pummel();
        instance_destroy(other);
    }
}

enum UnknownEnum
{
    Value_42 = 42
}
