/// @description Set dimensions


if button_w_override != -1{
	text_w = button_w_override
}else{
	text_w = string_width(text)*2+20
}

if button_h_override != -1{
	text_h = button_h_override
}else{
	text_h = string_height(text)*2+20
}

image_xscale = (text_w)/sprite_get_width(sprite_index)
image_yscale = (text_h)/sprite_get_height(sprite_index)



