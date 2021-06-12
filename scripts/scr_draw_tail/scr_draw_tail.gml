function scr_draw_tail(argument0, argument1, argument2, argument3) {

	var offset_x = argument0
	var offset_y = argument1
	var col_1 = argument2
	var col_2 = argument3

	var start_x = x+tail_offset_adj_x
	var start_y = y+tail_offset_y

	var line_segments = 10

	var prev_line_x = start_x
	var prev_line_y = start_y
	for (var i = 0; i < line_segments; i++){
	
		var line_pos_x = start_x+(i/line_segments)*(tail_end_x-start_x)
		var line_pos_y = start_y+(i/line_segments)*(tail_end_y-start_y)
	
		var a = 10*(1-(tail_distance/tail_length_max))
		var b = 1
	
		var sin_val = a*sin(i/b)
	
		var sin_x = lengthdir_x(sin_val,point_direction(start_x,start_y,tail_end_x,tail_end_y)-90)
		var sin_y = lengthdir_y(sin_val,point_direction(start_x,start_y,tail_end_x,tail_end_y)-90)
	
		if i%2 = 0{
			var col = col_1
			var this_line_x = line_pos_x+sin_x
			var this_line_y = line_pos_y+sin_y
		}else{
			var col = col_2
			var this_line_x = line_pos_x-sin_x
			var this_line_y = line_pos_y-sin_y
		}
	
		draw_line_width_color(prev_line_x+offset_x,prev_line_y+offset_y,this_line_x+offset_x,this_line_y+offset_y,1,col,col)
	
		var prev_line_x = this_line_x
		var prev_line_y = this_line_y
	
	
	}
	
	draw_line_width_color(prev_line_x+offset_x,prev_line_y+offset_y,tail_end_x,tail_end_y,1,col,col)



}
