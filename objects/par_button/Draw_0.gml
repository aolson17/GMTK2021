



draw_set_valign(fa_bottom)
draw_set_halign(fa_center)


if !enabled{
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_gray,image_alpha)
	scr_draw_outline_scaled(x,y+y_offset*2-12,text,c_ltgray,c_black,1,2)
}else{
	draw_self()
	scr_draw_outline_scaled(x,y+y_offset*2-12,text,c_white,c_black,1,2)
}




