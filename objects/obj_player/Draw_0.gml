

if state = states.normal && aim_hold {
	scr_draw_dotted_line(tail_end_x,tail_end_y,mouse_x,mouse_y,c_white,.9)
}

if selected_gun != -1{
	for(var i = 0; i < instance_number(obj_pillar_place); i++){
		var target = instance_find(obj_pillar_place,i)
		scr_draw_dotted_line(tail_end_x,tail_end_y,target.x,target.y-16,c_white,.2)
	}
	for(var i = 0; i < instance_number(obj_spawner); i++){
		var target = instance_find(obj_spawner,i)
		scr_draw_dotted_line(tail_end_x,tail_end_y,target.x,target.y-8,c_black,.2)
	}
}


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




