
// Inherit the parent event
event_inherited();

toggleable = true

text = "Mute Music"

press_function = function(){
	global.music_volume = 1-global.music_volume
	audio_sound_gain(obj_music.music_playing_id, global.master_volume*global.music_volume, 0)
}

if global.music_volume = 0{
	toggle = true
}
