
global.master_volume = 1
global.sound_volume = 1

randomize()


font = font_add_sprite_ext(spr_font,"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_!?():.,'",true,2)

draw_set_font(font)


scope_surf_scale = obj_camera.width/view_wport[0] // The scale between the size scope surface and gui size

