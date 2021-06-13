if !surface_exists(ui_surf){
	ui_surf = surface_create(surf_w,surf_h)
}

draw_set_halign(fa_left)

surface_set_target(ui_surf)
draw_clear_alpha(c_black,0)

scr_draw_outline(5,5,"Ammo: "+string(obj_player.current_ammo),c_white,c_black,1)
scr_draw_outline(5,25,"HP: "+string(obj_player.hp),c_white,c_black,1)


surface_reset_target()

draw_surface_ext(ui_surf,0,0,2,2,0,c_white,1)