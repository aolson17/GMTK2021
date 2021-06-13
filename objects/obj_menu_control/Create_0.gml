
if instance_number(obj_menu_control) > 1{
	instance_destroy()
	exit
}

global.master_volume = 1
global.sound_volume = 1
global.music_volume = 1


global.levels_complete = 0


draw_set_circle_precision(32)


randomize()

global.font = font_add_sprite_ext(spr_font,"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_!?():.,'",true,2)

draw_set_font(global.font)