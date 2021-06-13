
// Inherit the parent event
event_inherited();

draw_set_color(c_black)
if global.level_1_time != -1{
	draw_text(x,y+10,"Time: "+string(global.level_1_time))
}