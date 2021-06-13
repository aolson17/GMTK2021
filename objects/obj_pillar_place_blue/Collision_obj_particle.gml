/// @description Create or destroy pillar

if point_distance(other.target_x,other.target_y,x,y) > 20{
	// Not the target
	exit
}

instance_destroy(other) // Destroy the particle


if my_pillar = noone{
	// Create pillar
	
	my_pillar = -1
	
	alarm[0] = 1
}else{
	if my_pillar != -1{
		instance_destroy(my_pillar)
	}
	my_pillar = noone
	alarm[0] = 0
}

