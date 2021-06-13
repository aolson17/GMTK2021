

if hp < 0 && !died{
	died = true
	
	repeat(4){
		var chunk_spr = choose(spr_ballue_body_1)
		ds_list_add(obj_effects.bouncy_effects,new bouncy_effect(chunk_spr,x,y-12,y,irandom(360), 2))
	}
	
	instance_create_layer(x,y,"Control",obj_part_eyes)
	
	alarm[3] = 120
	exit
}

event_inherited()
message = ""

image_speed = 1

mouse_dir = point_direction(x,y,mouse_x,mouse_y)

#region Movement

if state != states.grapple && state != states.grapple_shoot && state != states.knockback{
	can_move = true
	move_x = keyboard_check(ord("D"))-keyboard_check(ord("A"))
	move_y = keyboard_check(ord("S"))-keyboard_check(ord("W"))
	if move_x != 0 || move_y != 0{
		move_dir = point_direction(0,0,move_x,move_y)
		target_x = x+lengthdir_x(move_spd,move_dir)
		target_y = y+lengthdir_y(move_spd,move_dir)
	}else{
		can_move = false // Don't willingly move unless directed to by player
	}
}else{
	can_move = false
}


	
if moving{
	if abs(angle_difference(move_dir,90)) < 45{
		sprite_index = spr_player_up
	}else if abs(angle_difference(move_dir,270)) < 45{
		sprite_index = spr_player_down
	}else{
		sprite_index = spr_player
	}
}

if aim_hold{
	if abs(angle_difference(mouse_dir,90)) < 45{
		sprite_index = spr_player_up
	}else if abs(angle_difference(mouse_dir,270)) < 45{
		sprite_index = spr_player_down
	}else{
		sprite_index = spr_player
	}
	
	if abs(angle_difference(mouse_dir,0)) < 90{
		image_xscale = 1
	}else{
		image_xscale = -1
	}
}

	
if state = states.knockback{
	sprite_index = spr_ballue_hurt
}else{
	if prev_state = states.knockback{
		sprite_index = spr_player
	}
}
	
#endregion
	
#region Reload
	
if selected_gun != -1{
	if state = states.normal{
		if reload && gun_frame = 0{ // If the player hit the reload button and there is no muzzle flash
			
			with(obj_spawner){ // Spawn enemies
				var part = instance_create_layer(obj_player.tail_end_x,obj_player.tail_end_y,"Bullets",obj_particle)
				part.target_x = x
				part.target_y = y-8
				part.sprite_index = spr_particle2
			}
			
			scr_play_sound(snd_reload,true)
			
			state = states.reload
			// To reload the gun spins around, starting at 0 and then has to lerp to 360
			reload_angle_offset = 0
		}
	}
	
	if state = states.reload{
		reload_angle_offset += global.guns[|selected_gun].reload_spd_factor*(360-reload_angle_offset)
		if reload_angle_offset > 355{
			state = states.normal
			current_ammo = global.guns[|selected_gun].max_ammo
			reload_angle_offset = 0
		}
	}else{
		// If the reload was interupted
		reload_angle_offset += global.guns[|selected_gun].reload_spd_factor*(0-reload_angle_offset)
	}
}else{
	reload_angle_offset = 0
}

#endregion

#region Recoil

if selected_gun != -1{
	var recoil_recovery_factor = global.guns[|selected_gun].recoil_recovery_factor
	
	current_recoil += recoil_recovery_factor*(global.guns[|selected_gun].recoil_min-current_recoil)
}

#endregion

#region Fire gun

kickback_target = 0
if state = states.normal{
	if selected_gun != -1{
		if current_ammo <= 0{
			// TODO add sparks and a sound
		}else{ // Has a bullet to fire
			if gun_ready && (shoot || (global.guns[|selected_gun].auto && shoot_hold)){
				
				with(obj_pillar_place){ // Toggle pillars
					if obj_player.selected_gun = gun_index || gun_index = -1{
						var part = instance_create_layer(obj_player.tail_end_x,obj_player.tail_end_y,"Bullets",obj_particle)
						part.target_x = x
						part.target_y = y-16
					}
				}
				
				current_ammo--
				show_debug_message(current_ammo)
				current_recoil += global.guns[|selected_gun].recoil
				kickback_target = global.guns[|selected_gun].kickback
				flash = true
				alarm[0] = flash_frames
				gun_ready = false
				alarm[1] = global.guns[|selected_gun].fire_frames
		
				// Screen shake
				obj_camera.shake += global.guns[|selected_gun].shake
		
				// Find the start position of the bullet
				var bullet_x = gun_pos_x+lengthdir_x(global.guns[|selected_gun].end_dis,gun_dir)
				var bullet_y = gun_pos_y+lengthdir_y(global.guns[|selected_gun].end_dis,gun_dir)
				
				// Create the bullet
				var bullet
				repeat(global.guns[|selected_gun].bullet_count){
					var gun_dir_recoil = gun_dir + choose(-1,1)*random(current_recoil)
					bullet = instance_create_layer(bullet_x,bullet_y, "Bullets", global.guns[|selected_gun].bullet_obj)
					bullet.dir = gun_dir_recoil
					bullet.gun_index = selected_gun
				}
				
				scr_play_sound(bullet.snd,true)
			}
		}
	}else{
		if shoot{
			// Attempt grapple
			state = states.grapple_shoot
		
			grapple_dir = mouse_dir
			
			snd_extend = scr_play_sound(snd_tail_extend,true)
		}
	}
}
	
#endregion

#region Gun draw info

if selected_gun != -1{
	
	
	aim_dir = point_direction(tail_end_x,tail_end_y,mouse_x,mouse_y)
	

	kickback_current += global.guns[|selected_gun].kickback_spd_factor*(kickback_target-kickback_current)

	gun_pos_x = tail_end_x+lengthdir_x(-kickback_current,aim_dir)
	gun_pos_y = tail_end_y+lengthdir_y(-kickback_current,aim_dir)

	gun_dir = point_direction(gun_pos_x,gun_pos_y,mouse_x,mouse_y)
	
	//gun_dir_recoil = gun_dir + choose(-1,1)*random(current_recoil)

	if abs(angle_difference(aim_dir,0)) < 90{
		gun_xscale = 1
		gun_dir_adj = gun_dir
	}else{
		gun_xscale = -1
		gun_dir_adj = gun_dir + 180
	}

	if flash{
		gun_frame = 1
	}else{
		gun_frame = 0
	}

}

#endregion

#region Tail position

tail_offset_adj_x += (tail_offset_x*image_xscale-tail_offset_adj_x)*tail_offset_spd_factor

tail_distance = point_distance(x+tail_offset_adj_x,y+tail_offset_y,tail_end_x,tail_end_y)

if state != states.grapple && state != states.grapple_shoot{
	if tail_length > tail_length_min{
		tail_length *= .95
	}else{
		tail_length = tail_length_min
	}
	
	if tail_distance > tail_length{
		var dir = point_direction(x+tail_offset_adj_x,y+tail_offset_y,tail_end_x,tail_end_y)
		
		tail_end_target_x = x+tail_offset_adj_x+lengthdir_x(tail_length,dir)
		tail_end_target_y = y+tail_offset_y+lengthdir_y(tail_length,dir)
	}
	
	
}

if aim_hold && state = states.normal{
	aim_dir = point_direction(x,y+tail_offset_y,mouse_x,mouse_y)
	tail_end_target_x = x+lengthdir_x(tail_length_min,aim_dir)
	tail_end_target_y = y+tail_offset_y+lengthdir_y(tail_length_min,aim_dir)
}

tail_end_x += (tail_end_target_x-tail_end_x)*tail_end_spd_factor
tail_end_y += (tail_end_target_y-tail_end_y)*tail_end_spd_factor

#endregion

#region Grapple

if state = states.grapple_shoot{
	
	
	if tail_distance < tail_length_max{
		
		
		tail_end_target_x += lengthdir_x(grapple_spd,grapple_dir)
		tail_end_target_y += lengthdir_y(grapple_spd,grapple_dir)
		
		var collision = collision_line(tail_end_x,tail_end_y,tail_end_target_x,tail_end_target_y,par_wall,true,true)
		//var collision2 = collision_line(tail_end_x,tail_end_y,tail_end_target_x,tail_end_target_y,obj_gun,true,true)
		
		tail_end_x = tail_end_target_x
		tail_end_y = tail_end_target_y
		
		if collision != noone{
			// Hit wall
			
			var temp_x = x
			var temp_y = y
			x = tail_end_x
			y = tail_end_y
			if distance_to_object(obj_space) < 18{
				state = states.normal
				x = temp_x
				y = temp_y
				snd_retract = scr_play_sound(snd_tail_retract,true)
			}else{
				x = temp_x
				y = temp_y
				state = states.grapple
				grapple_dis = point_distance(tail_end_x,tail_end_y,x,y)
				prev_grapple_dis = grapple_dis
				snd_retract = scr_play_sound(snd_tail_retract,true)
			}
			
		}/*else if collision2 != noone{
			// Check for pickup
			tail_end_x = collision2.x
			tail_end_y = collision2.y
			selected_gun = collision2.gun_index
			instance_destroy(collision2)
			state = states.normal
		}*/
		
	}else{
		state = states.normal
		snd_retract = scr_play_sound(snd_tail_retract,true)
	}
}

if state = states.grapple{
	// Move toward wall
	target_x = x
	target_y = y
	
	if snd_extend != -1 && audio_is_playing(snd_extend){
		audio_sound_gain(snd_extend, 0, 300)
	}
	
	moving = false
	var grapple_xspd = lengthdir_x(grapple_spd,grapple_dir)
	var grapple_yspd = lengthdir_y(grapple_spd,grapple_dir)
	
	// Face the target
	if sign(tail_end_x-x) != 0{
		image_xscale = sign(tail_end_x-x)
	}
	
	move_success = scr_move_collide(grapple_xspd,grapple_yspd,move_mask,par_wall,true)
	if !move_success{
		state = states.normal
	}
	
	// Safety measures
	grapple_dis = point_distance(tail_end_x,tail_end_y,x,y)
	
	if prev_grapple_dis < grapple_dis{
		// Player is moving away from grapple point
		state = states.normal
	}
	
	prev_grapple_dis = grapple_dis
	
	if tail_distance > tail_length_max{
		state = states.normal
	}
	
	if state = states.normal{
		if snd_retract != -1 && audio_is_playing(snd_retract){
			audio_sound_gain(snd_retract, 0, 300)
		}
	}
}

#endregion

#region Interact

if state = states.normal{
	if selected_gun != -1{
		if interact{
			// Drop gun
			var drop = instance_create_layer(tail_end_x,tail_end_y,"Instances",obj_gun)
			drop.gun_index = selected_gun
			drop.ammo = current_ammo
			current_ammo = 0
			selected_gun = -1
			
			scr_play_sound(snd_weapon_drop,true)
		}
	}else{
		if distance_to_object(obj_gun) < interact_dis{
			message = "Pickup"
			if interact{
				var pickup = instance_nearest(x,y,obj_gun)
				tail_end_x = pickup.x
				tail_end_y = pickup.y
				selected_gun = pickup.gun_index
				if pickup.ammo != -1{
					current_ammo = pickup.ammo
				}else{
					current_ammo = 0
				}
				instance_destroy(pickup)
				scr_play_sound(snd_weapon_get,true)
			}
		}
	}
}

#endregion

