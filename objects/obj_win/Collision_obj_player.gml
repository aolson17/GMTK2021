/// @description Win Level



var next_room = rm_menu

switch(room){
	case rm_0:
		next_room = rm_1
	case rm_1:
		if global.levels_complete < 1{
			global.levels_complete = 1
		}
}


var transition = instance_create_layer(x,y,"Cursor",obj_transition)
transition.room_target = next_room

instance_destroy()