
var pressing = false

if point_in_rectangle(mouse_x,mouse_y,bbox_left,bbox_top,bbox_right,bbox_bottom){
	if mouse_check_button(mb_left){
		pressing = true
	}
	image_index = 1
	if mouse_check_button_released(mb_left){
		toggle = !toggle
		press_function()
		scr_play_sound(snd_button_select,true)
	}
}else{
	image_index = 0
}


if toggleable{
	if toggle{
		sprite_index = spr_button_down
		y_offset = 1
	}else{
		sprite_index = spr_button
		y_offset = 0
	}
}else{
	sprite_index = spr_button
	y_offset = 0
}

if pressing{
	sprite_index = spr_button_down
	y_offset = 1
}