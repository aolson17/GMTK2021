
// Inherit the parent event
event_inherited();


if attack_cooldown_frames = 0{
	target_x = obj_player.x
	target_y = obj_player.y
	obj_player.mask_index = obj_player.hit_mask
	mask_index = hit_mask
	if distance_to_object(obj_player) < 3{
		scr_knockback_target(obj_player,knockback,point_direction(x,y,target_x,target_y))
		obj_player.hp -= damage
		attack_cooldown_frames = attack_cooldown_frames_max
	}
}else{
	attack_cooldown_frames--
	target_x = x-(x-obj_player.x)
	target_y = x-(y-obj_player.y)
}


if hp <= 0{
	scr_play_sound(snd_destroyed)
	instance_destroy()
}



