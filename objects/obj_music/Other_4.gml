

if room = rm_menu || string_pos("Cutscene",room_get_name(room)) != 0{
	music_to_play = msc_title_theme_cutscene
}else if room = rm_win{
	music_to_play = msc_end_credits
}else if room = rm_gmtk{
	music_to_play = "none"
}else{
	music_to_play = msc_level
}
