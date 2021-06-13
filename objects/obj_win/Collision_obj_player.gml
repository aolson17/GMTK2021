/// @description Win Level



var next_room = rm_menu

switch(room){
	case rm_0:
		next_room = rm_1
	case rm_1:
		if global.levels_complete < 1{
			global.levels_complete = 1
		}
		if obj_control.timer < global.level_1_time || global.level_1_time = -1{
			global.level_1_time = obj_control.timer
		}
		next_room = rm_2
	case rm_2:
		if global.levels_complete < 2{
			global.levels_complete = 2
		}
		if obj_control.timer < global.level_2_time || global.level_2_time = -1{
			global.level_2_time = obj_control.timer
		}
		next_room = rm_3
	case rm_3:
		if global.levels_complete < 3{
			global.levels_complete = 3
		}
		if obj_control.timer < global.level_3_time || global.level_3_time = -1{
			global.level_3_time = obj_control.timer
		}
		next_room = rm_4
	case rm_4:
		if global.levels_complete < 4{
			global.levels_complete = 4
		}
		if obj_control.timer < global.level_4_time || global.level_4_time = -1{
			global.level_4_time = obj_control.timer
		}
		next_room = rm_5
	case rm_5:
		if global.levels_complete < 5{
			global.levels_complete = 5
		}
		if obj_control.timer < global.level_5_time || global.level_5_time = -1{
			global.level_2_time = obj_control.timer
		}
}


ini_open("data.ini")

ini_write_real("Data", "levels_complete", global.levels_complete)
ini_write_real("Data", "level_1_time", global.level_1_time)
ini_write_real("Data", "level_2_time", global.level_2_time)
ini_write_real("Data", "level_3_time", global.level_3_time)
ini_write_real("Data", "level_4_time", global.level_4_time)
ini_write_real("Data", "level_5_time", global.level_5_time)

ini_close()


var transition = instance_create_layer(x,y,"Cursor",obj_transition)
transition.room_target = next_room

instance_destroy()