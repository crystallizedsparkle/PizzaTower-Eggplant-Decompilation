var cx, cy, cw, ch, edge_x, edge_y, pad, l, t, r, b;

if (!instance_exists(objectID))
{
    instance_destroy();
    exit;
}

x = objectID.x;
y = objectID.y;
cx = camera_get_view_x(view_camera[0]);
cy = camera_get_view_y(view_camera[0]);
cw = camera_get_view_width(view_camera[0]);
ch = camera_get_view_height(view_camera[0]);
edge_x = abs(sprite_width) / 2;
edge_y = abs(sprite_height) / 2;
pad = 12;
yoffset = Wave(-4, 4, 2, 8);
l = cx + edge_x + pad;
t = cy + edge_y + pad;
r = (cx + cw) - edge_x - pad;
b = (cy + ch) - edge_y - pad;
x = clamp(x, l, r);
y = clamp(y, t, b);

if (!collision_rectangle(l - edge_x, t - edge_y, r + edge_x, b + edge_y, objectID, false, false))
    visible = true;
else
    visible = false;
