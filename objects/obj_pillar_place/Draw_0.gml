


draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,col,image_alpha)

if gun_index != -1{
	shader_set(shd_greyscale)
	draw_set_alpha(.8)
	draw_sprite(global.guns[|gun_index].spr,0,x,y-16)
	draw_set_alpha(1)
	shader_reset()
}