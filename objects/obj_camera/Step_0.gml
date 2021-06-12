


var mouse_power_scope = mouse_power+obj_player.aim_hold*aim_power

target_x = target.x+lengthdir_x(abs(mouse_power_scope*(mouse_x-target.x)),target.mouse_dir)
target_y = target.y+lengthdir_y(abs(mouse_power_scope*(mouse_y-target.y)),target.mouse_dir)

x = clamp(x+(target_x-x)*spd_factor,0+width/2,room_width-width/2)
y = clamp(y+(target_y-y)*spd_factor,0+height/2,room_height-height/2)

#region Zoom

zoom += (zoom_target-zoom)*zoom_spd_factor
zoom_width = width * zoom
zoom_height = height * zoom

#endregion

#region Camera shake

if shake > 0{
	shake_offset_x = choose(-1,1)*((irandom(shake)+1))
	shake_offset_y = choose(-1,1)*((irandom(shake)+1))
	shake_offset_r = choose(-1,1)
	shake--
}else{
	shake_offset_x = 0
	shake_offset_y = 0
	shake_offset_r = 0
}

#endregion

#region Update camera position

camera_set_view_pos(camera, ((x+shake_offset_x)-zoom_width/2), ((y+shake_offset_y)-zoom_height/2))
camera_set_view_angle(camera, shake_offset_r)
camera_set_view_size(camera,zoom_width,zoom_height)

#endregion



