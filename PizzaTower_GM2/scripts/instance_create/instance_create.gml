function instance_create(_x, _y, _obj)
{
    var myDepth = object_get_depth(_obj);
    return instance_create_depth(_x, _y, myDepth, _obj);
}
