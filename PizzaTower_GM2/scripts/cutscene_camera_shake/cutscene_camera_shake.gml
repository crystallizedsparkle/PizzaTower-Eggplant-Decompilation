function cutscene_camera_shake(_magnitude, _mag_acc)
{
    with (obj_camera)
    {
        shake_mag = _magnitude;
        shake_mag_acc = _mag_acc;
    }
    
    cutscene_end_action();
}
