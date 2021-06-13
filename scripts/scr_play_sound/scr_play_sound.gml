function scr_play_sound(argument0,allow_overlap) {

	var sound_ = argument0

	if audio_is_playing(sound_) && !allow_overlap{
		return -1
	}


	var sound = audio_play_sound(sound_,0,0)
	audio_sound_gain(sound,global.master_volume*global.sound_volume,0)


	return sound


}
