
if instance_number(obj_menu_control) > 1{
	instance_destroy()
	exit
}


ini_open("data.ini")

global.sound_volume = ini_read_real("Data","sound_volume",1)
global.music_volume = ini_read_real("Data","music_volume",1)
global.levels_complete = ini_read_real("Data","levels_complete",0)

global.level_1_time = ini_read_real("Data","level_1_time",-1)
global.level_2_time = ini_read_real("Data","level_2_time",-1)
global.level_3_time = ini_read_real("Data","level_3_time",-1)
global.level_4_time = ini_read_real("Data","level_4_time",-1)

ini_close()

global.master_volume = 1




draw_set_circle_precision(64)


randomize()

global.font = font_add_sprite_ext(spr_font,"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_!?():.,'",true,2)

draw_set_font(global.font)