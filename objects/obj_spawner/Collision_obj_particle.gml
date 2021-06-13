/// @description Create enemy


if point_distance(other.target_x,other.target_y,x,y) > 20{
	// Not the target
	exit
}

instance_destroy(other) // Destroy the particle


var spawned_enemies = 0
with(par_enemy){
	if spawner = other.id{
		spawned_enemies++
	}
}

if spawned_enemies < 2{
	scr_play_sound(snd_spawn)

	var enemy = instance_create_layer(x,y+10,"Instances",obj_ufo)
	enemy.spawner = id
}