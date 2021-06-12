


// Converts a position in the room to where it is in the gui


function room_to_gui_x(_x){
	var gui_room_scale_w = view_wport[0]/obj_camera.width
	return (_x-obj_camera.x+obj_camera.width/2)*gui_room_scale_w
}

function room_to_gui_y(_y){
	var gui_room_scale_h = view_hport[0]/obj_camera.height
	return (_y-obj_camera.y+obj_camera.height/2)*gui_room_scale_h
}


