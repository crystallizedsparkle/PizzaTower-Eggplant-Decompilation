if (other.instakillmove || other.state == states.handstandjump)
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
