/// @description Attempt pillar create


if point_distance(x,y-16,instance_nearest(x,y-16,par_character).x,instance_nearest(x,y-16,par_character).y) > 25{
	my_pillar = instance_create_layer(x,y,"Instances",obj_pillar)
}else{
	alarm[0] = 10
}


