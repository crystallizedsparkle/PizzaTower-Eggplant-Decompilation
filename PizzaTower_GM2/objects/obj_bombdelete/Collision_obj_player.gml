if (!collide)
{
    if (other.state == states.handstandjump || other.state == states.lungeattack)
    {
        other.state = states.bombdelete;
        collide = true;
    }
}

enum UnknownEnum
{
    Value_42 = 42,
    Value_43,
    Value_183 = 183
}
