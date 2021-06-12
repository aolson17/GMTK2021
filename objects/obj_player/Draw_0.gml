




line_color = make_color_hsv(202,100,71)
line_color = make_color_rgb(0,149,238)
line_color_back = make_color_rgb(0,113,180)


if y+tail_offset_y < tail_end_y{
	draw_self()
}

scr_draw_tail(1,0,c_black,c_black)
scr_draw_tail(-1,0,c_black,c_black)
scr_draw_tail(0,1,c_black,c_black)
scr_draw_tail(0,-1,c_black,c_black)
scr_draw_tail(0,0,line_color,line_color_back)


// Draw gun
if selected_gun != -1{
	draw_sprite_ext(global.guns[|selected_gun].spr,gun_frame,gun_pos_x,gun_pos_y,gun_xscale,1,gun_dir_adj+reload_angle_offset,c_white,1)
}

if y+tail_offset_y >= tail_end_y{
	draw_self()
}




