///@description Save Data


ini_open("data.ini")

ini_write_real("Data", "sound_volume",global.sound_volume)
ini_write_real("Data", "music_volume",global.music_volume)

ini_close()
