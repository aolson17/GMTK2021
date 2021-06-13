

global.master_volume = 1

global.music_volume = 1
global.sound_volume = 1




music_to_play = msc_title_theme_cutscene

music_playing_id=audio_play_sound(music_to_play,0,true)
audio_sound_gain(music_playing_id, 0, 0)
audio_sound_gain(music_playing_id, global.master_volume*global.music_volume, 2000)


was_none = false

normal_volume = -1 // Don't change this (Is set by mute command)