
// Inherit the parent event
event_inherited();

toggleable = true

text = "Mute Sound"

press_function = function(){
	global.sound_volume = 1-global.sound_volume
}

if global.sound_volume = 0{
	toggle = true
}
