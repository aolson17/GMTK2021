
// Inherit the parent event
event_inherited();



target_x = obj_player.x
target_y = obj_player.y


if hp <= 0{
	scr_play_sound(snd_destroyed)
	instance_destroy()
}