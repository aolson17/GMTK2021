if !surface_exists(ui_surf){
	ui_surf = surface_create(surf_w,surf_h)
}

draw_set_halign(fa_left)

surface_set_target(ui_surf)
draw_clear_alpha(c_black,0)

if obj_player.selected_gun != -1{
	scr_draw_outline(5,28,"Gun: "+string(global.guns[|obj_player.selected_gun].name),c_white,c_black,1)
	scr_draw_outline(5,39,"Ammo: "+string(obj_player.current_ammo),c_white,c_black,1)
	
	if obj_player.current_ammo = 0{
		scr_draw_outline(15,50,"Reload with R!",c_white,c_black,1)
	}
}
scr_draw_outline(5,9,"HP: "+string(obj_player.hp),c_white,c_black,1)

if room != rm_0{
	scr_draw_outline(240,9,"Time: "+string(obj_control.timer),c_white,c_black,1)
}

surface_reset_target()

draw_surface_ext(ui_surf,0,0,2,2,0,c_white,1)