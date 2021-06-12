
// Inherit the parent event
event_inherited();

move_spd = 1 // Set in child
move_mask = -1 // Set in child
hit_mask = -1 // Set in child



knockback_spd = 0 // When knocked back, this is set
knockback_dir = 0

xspd = 0
yspd = 0

target_x = x
target_y = y

hurt_frames = 5
hurt = false // If hurt frames are showing

can_move = true

moving = false

knockback_immune = false // At certain times a character can't be forced into a different state


enum states{
	normal,
	knockback,
	idle,
	wander,
	chase,
	attack,
	reload,
	grapple,
	grapple_shoot,
}

state = states.normal
prev_state = state
