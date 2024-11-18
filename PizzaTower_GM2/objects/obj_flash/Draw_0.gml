var cam_x, cam_y, cam_w, cam_h;

draw_set_alpha(fadealpha);
draw_set_color(c_white);
cam_x = camera_get_view_x(view_camera[0]);
cam_y = camera_get_view_y(view_camera[0]);
cam_w = camera_get_view_width(view_camera[0]);
cam_h = camera_get_view_height(view_camera[0]);
draw_rectangle(0, 0, cam_x + cam_w, cam_y + cam_h, false);
draw_set_alpha(1);
