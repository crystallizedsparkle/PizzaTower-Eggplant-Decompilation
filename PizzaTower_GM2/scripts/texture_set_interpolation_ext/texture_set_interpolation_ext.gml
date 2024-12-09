function texture_set_interpolation_ext(_sampler_id, _enable)
{
    gpu_set_texfilter_ext(_sampler_id, _enable);
}
