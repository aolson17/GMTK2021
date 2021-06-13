///@param x
///@param y
///@param text
///@param text_color
///@param outline_color
///@param outline_size
///@param scale
function scr_draw_outline_scaled(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	var text_x = argument0
	var text_y = argument1
	var text = argument2
	var text_color = argument3
	var outline_color = argument4
	var outline_size = argument5
	var scale = argument6

	var prev_color = draw_get_color()
	draw_set_color(outline_color)

	draw_text_transformed(text_x+outline_size,text_y,text,scale,scale,0)
	draw_text_transformed(text_x-outline_size,text_y,text,scale,scale,0)
	draw_text_transformed(text_x,text_y+outline_size,text,scale,scale,0)
	draw_text_transformed(text_x,text_y-outline_size,text,scale,scale,0)
	draw_text_transformed(text_x+outline_size,text_y+outline_size,text,scale,scale,0)
	draw_text_transformed(text_x-outline_size,text_y+outline_size,text,scale,scale,0)
	draw_text_transformed(text_x+outline_size,text_y-outline_size,text,scale,scale,0)
	draw_text_transformed(text_x-outline_size,text_y-outline_size,text,scale,scale,0)

	draw_set_color(text_color)

	draw_text_transformed(text_x,text_y,text,scale,scale,0)

	draw_set_color(prev_color)


}
