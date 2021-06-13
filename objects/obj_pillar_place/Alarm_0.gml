/// @description Attempt pillar create


if !place_meeting(x,y,par_character){//point_distance(x,y-16,instance_nearest(x,y-16,par_character).x,instance_nearest(x,y-16,par_character).y) > 25{
	my_pillar = instance_create_layer(x,y,"Instances",obj_pillar)
	my_pillar.col = col
}else{
	alarm[0] = 10
}


