/// @description Perform the room transition

room_goto(room_target)

if room_target = rm_menu{
	instance_destroy(obj_camera)
}

fade_out = false

alarm[1] = fade_ticks

