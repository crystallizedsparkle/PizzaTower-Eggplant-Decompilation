instance_destroy();
global.hasfarmer[pos] = true;
other.farmerpos = pos;

switch (object_index)
{
    case obj_farmerpeasanto:
        instance_create_unique(x, y, 196);
        break;
    
    case obj_farmer2:
        instance_create_unique(x, y, 132);
        break;
    
    case obj_farmer3:
        instance_create_unique(x, y, 185);
        break;
}
