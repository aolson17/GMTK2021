
// Inherit the parent event
event_inherited();

toggleable = true

text = "Fullscreen"

press_function = function(){
	window_set_fullscreen(!window_get_fullscreen())
}
