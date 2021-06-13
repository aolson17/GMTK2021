/// @description Draw Cursor




#region Crosshair

//surface_set_target(crosshair_surf)


draw_set_color(c_white)
//draw_circle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),2,false)

gun_gui_x = room_to_gui_x(obj_player.gun_pos_x)
gun_gui_y = room_to_gui_y(obj_player.gun_pos_y)

var dis = point_distance(gun_gui_x,gun_gui_y,device_mouse_x_to_gui(0),device_mouse_y_to_gui(0))

var perp_dis = 2*tan(((obj_player.current_recoil)/2)*.0175)*dis

if obj_player.selected_gun != -1{
	draw_circle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),perp_dis,true)
}

var o_s = 1/scope_surf_scale // Offset scale
var offset_x = -.5*o_s // How many pixels to offset sprites by to center them over the cursor
var offset_y = -.5*o_s

//draw_sprite_ext(spr_crosshair_piece,0,device_mouse_x_to_gui(0)+offset_x-perp_dis,device_mouse_y_to_gui(0)+offset_y,1/scope_surf_scale,1/scope_surf_scale,0,c_white,1-scope_alpha)
//draw_sprite_ext(spr_crosshair_piece,0,device_mouse_x_to_gui(0)+.5*o_s+perp_dis,device_mouse_y_to_gui(0)+.5*o_s,1/scope_surf_scale,1/scope_surf_scale,180,c_white,1-scope_alpha)
//draw_sprite_ext(spr_crosshair_piece,0,device_mouse_x_to_gui(0)-.5*o_s,device_mouse_y_to_gui(0)+perp_dis+.5*o_s,1/scope_surf_scale,1/scope_surf_scale,90,c_white,1-scope_alpha)
//draw_sprite_ext(spr_crosshair_piece,0,device_mouse_x_to_gui(0)+.5*o_s,device_mouse_y_to_gui(0)-perp_dis+offset_y,1/scope_surf_scale,1/scope_surf_scale,-90,c_white,1-scope_alpha)
//
//draw_sprite_ext(spr_crosshair_center,0,device_mouse_x_to_gui(0)+offset_x,device_mouse_y_to_gui(0)+offset_y,1/scope_surf_scale,1/scope_surf_scale,0,c_white,1-scope_alpha)


#endregion







