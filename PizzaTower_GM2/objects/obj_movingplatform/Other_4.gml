hdir = sign(hmovespeed);
vdir = sign(vmovespeed);

if (hdir != 0)
    hscale = hdir;

if (vdir != 0)
    vscale = vdir;

if (vmovespeed == 0)
    v_velocity = 0;
else
    v_velocity = abs(vmovespeed);

if (hmovespeed == 0)
    h_velocity = 0;
else
    h_velocity = abs(hmovespeed);

if (escape && !global.panic)
{
    vmovespeed = 0;
    hmovespeed = 0;
}
