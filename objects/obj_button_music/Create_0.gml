
// Inherit the parent event
event_inherited();

toggleable = true

text = "Mute Music"

press_function = function(){
	global.music_volume = 1-global.music_volume
}

if global.music_volume = 0{
	toggle = true
}
