/// @description Create enemy


if point_distance(other.target_x,other.target_y,x,y) > 20{
	// Not the target
	exit
}

instance_destroy(other) // Destroy the particle



scr_play_sound(snd_spawn)

instance_create_layer(x,y+10,"Instances",obj_ufo)

