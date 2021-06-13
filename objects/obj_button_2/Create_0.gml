
// Inherit the parent event
event_inherited();

if global.levels_complete < 1{
	enabled = false
}

text = "Level 2"

press_function = function(){
	var transition = instance_create_layer(x,y,"Cursor",obj_transition)
	transition.room_target = rm_2
}
