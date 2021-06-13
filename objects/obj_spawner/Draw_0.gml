

draw_self()



shader_set(shd_greyscale)
draw_sprite_ext(object_get_sprite(spawned_enemy),0,x,y-8,.5,.5,0,c_white,1)
shader_reset()