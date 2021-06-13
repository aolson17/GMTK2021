

function scr_draw_dotted_line(x1,y1,x2,y2,col,alpha){
	
	var temp_col = draw_get_color()
	var temp_a = draw_get_alpha()
	
	draw_set_color(col)
	draw_set_alpha(alpha)
	
	var dash_dis = 10
	
	var segments = floor(point_distance(x1,y1,x2,y2)/dash_dis)
	
	var prev_x = x1
	var prev_y = y1
	
	for(var i = 0; i < segments; i++){
		
		var next_x = prev_x + (x2-x1)/segments
		var next_y = prev_y + (y2-y1)/segments
		
		if i%2 = 0{
			draw_line(prev_x,prev_y,next_x,next_y)
		}
		
		prev_x = next_x
		prev_y = next_y
	}
	
	draw_set_color(temp_col)
	draw_set_alpha(temp_a)
}