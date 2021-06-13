
show_message(room_get_name(room))

event_inherited()

#region Player Stats

move_spd = 2

hp_max = 15

move_mask = spr_player // Mask for movement
hit_mask = spr_player_hurt // Mask for bullet collisions

flash_frames = 3 // How many frames the muzzle flash lasts

tail_length_speed = 1.5
tail_speed = 10
tail_length_max = 200
tail_length_min = 15
tail_length = 0

tail_offset_x = -8
tail_offset_y = -8

grapple_spd = 9

interact_dis = 40

invincible = false
invincible_frames = 10

#endregion

tail_offset_adj_x = tail_offset_x // Have the x offset move smoothly when changing image_xscale
tail_offset_spd_factor = .1

hp = hp_max

tail_end_x = x
tail_end_y = y
tail_end_target_x = x
tail_end_target_y = y
tail_end_spd_factor = .25

gun_pos_x = x
gun_pos_y = y

moving = false

gun_dir = 0
gun_dir_adj = 0
gun_xscale = 1
mouse_dir = 0


selected_gun = -1 // Index in global.guns of the gun the player is holding. -1 means no gun

move_dir = 0 // Direction player last walked

gun_frame = 0
flash = false

current_recoil = 0 // How many degrees of innacuracy when shooting there currently is
reload_angle_offset = 0

kickback_target = 0
kickback_current = 0

gun_ready = true // If the gun is ready to shoot or is still on cooldown

current_ammo = 0

grapple_dir = 0 // The direction the tail is launched
prev_grapple_dis = 0 // Used to check if the player is moving past the grapple point

message = "" // A line of text above the player

snd_extend = -1 // The sound id for the extending tail
snd_retract = -1 // The sound id for the retracting tail

died = false