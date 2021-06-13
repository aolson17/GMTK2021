
// Inherit the parent event
event_inherited();


if attack_cooldown_frames = 0{
	target_x = obj_player.x
	target_y = obj_player.y
	obj_player.mask_index = obj_player.hit_mask
	mask_index = hit_mask
	if distance_to_object(obj_player) < 3 && !obj_player.invincible{
		scr_knockback_target(obj_player,knockback,point_direction(x,y,target_x,target_y))
		obj_player.hp -= damage
		obj_player.invincible = true
		obj_player.alarm[2] = obj_player.invincible_frames
		attack_cooldown_frames = attack_cooldown_frames_max
	}
}else{
	attack_cooldown_frames--
	var player_dir = point_direction(x,y,obj_player.x,obj_player.y)
	var dis = 100
	target_x = obj_player.x-lengthdir_x(dis,player_dir)
	target_y = obj_player.y-lengthdir_y(dis,player_dir)
	//dir = player_dir // Face the player
}


if hp <= 0{
	scr_play_sound(snd_destroyed, false)
	instance_destroy()
}


if moving{
	if abs(angle_difference(dir,90)) < 45{
		sprite_index = spr_robot_up
	}else if abs(angle_difference(dir,270)) < 45{
		sprite_index = spr_robot_down
	}else{
		sprite_index = spr_robot_side
	}
}

if state = states.knockback{
	sprite_index = spr_robot_hurt
}
