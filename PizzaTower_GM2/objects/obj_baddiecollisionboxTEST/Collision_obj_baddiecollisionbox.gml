if (object_index != obj_pizzaball)
{
    with (other)
    {
        if (instance_exists(baddieID) && instance_exists(other.baddieID) && baddieID != other.id && other.baddieID.killbyenemy)
        {
            if (baddieID.state == states.stun && baddieID.thrown)
            {
                instance_destroy(other.baddieID);
                
                if (baddieID.pepperman_grab)
                    instance_destroy(baddieID);
            }
        }
    }
}

