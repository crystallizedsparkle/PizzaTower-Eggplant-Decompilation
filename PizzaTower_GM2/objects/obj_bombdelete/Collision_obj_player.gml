if (!collide)
{
    if (other.state == UnknownEnum.Value_42 || other.state == UnknownEnum.Value_43)
    {
        other.state = UnknownEnum.Value_183;
        collide = true;
    }
}

enum UnknownEnum
{
    Value_42 = 42,
    Value_43,
    Value_183 = 183
}
