


global.guns = ds_list_create()

#region Set up gun stats

enum stat{
	name, // The shown name of this gun
	spr, // Sprite index for this gun
	kickback, // How many pixels the gun is kicked back after firing
	end_dis, // How far away the bullet is created. Usually equal to how long the barrel is in pixels
	shake, // How much screen shake this gun causes. Never should be greater than fire_frames
	auto, // Whether or not this gun automatically fires when fire button is held. True or false
	fire_frames, // Frames between each time the gun can be fired. Shots per second is 60/fire_frames
	knockback, // How much the enemy is knocked back in speed
	damage, // Normal damage dealt
	max_ammo, // Ammount of ammo before reload is necessary
	reload_spd_factor, // How quickly this gun reloads. 1 is instant, 0 is never
	recoil, // How many degrees of inaccracy this gun has after each shot
	recoil_max, // Max degrees of inaccuracy
	recoil_recovery_factor, // Speed factor for recovering from recoil. 1 is instant, 0 is never
	bullet_obj, // Which bullet object is used
	bullet_count, // How many bullets are shot
}

function gun(_stat_array) constructor{
	name = _stat_array[stat.name]
	spr = _stat_array[stat.spr]
	kickback = _stat_array[stat.kickback]
	end_dis = _stat_array[stat.end_dis]
	shake = _stat_array[stat.shake]
	auto = 	_stat_array[stat.auto]
	fire_frames = _stat_array[stat.fire_frames]
	knockback = _stat_array[stat.knockback]
	damage = _stat_array[stat.damage]
	max_ammo = _stat_array[stat.max_ammo]
	reload_spd_factor = _stat_array[stat.reload_spd_factor]
	recoil = _stat_array[stat.recoil]
	recoil_max = _stat_array[stat.recoil_max]
	recoil_recovery_factor = _stat_array[stat.recoil_recovery_factor]
	bullet_obj = _stat_array[stat.bullet_obj]
	bullet_count = _stat_array[stat.bullet_count]
	
	// Calculate how quickly kickback must recover to be ready for next shot
	var target_min_kickback = 4 // Pixel allowance for recovery
	kickback_spd_factor = 1 - power(target_min_kickback/kickback,1/fire_frames)
}

#endregion

#region Gun scripts

// Find gun index from name
function scr_find_gun(_name){
	if is_string(_name) && _name != ""{ // Check acceptable input
		for(var i = 0; i < ds_list_size(global.guns); i++){
			var this_gun = global.guns[|i]
			if string_pos(string_upper(_name),string_upper(this_gun.name)) != 0{
				return i
			}
		}
	}
	return -1 // If nothing was found
}

#endregion

#region Guns

var stat_array

stat_array[stat.name] = "Bubble"
stat_array[stat.spr] = spr_gun_bubble
stat_array[stat.kickback] = 50
stat_array[stat.end_dis] = 18
stat_array[stat.shake] = 5
stat_array[stat.auto] = false
stat_array[stat.fire_frames] = 45
stat_array[stat.knockback] = 5
stat_array[stat.damage] = 2
stat_array[stat.max_ammo] = 2
stat_array[stat.reload_spd_factor] = .1
stat_array[stat.recoil] = 20
stat_array[stat.recoil_max] = 40
stat_array[stat.recoil_recovery_factor] = 0.05
stat_array[stat.bullet_obj] = obj_bubble
stat_array[stat.bullet_count] = 1

ds_list_add(global.guns,new gun(stat_array))

#endregion

