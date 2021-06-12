

var xspd = lengthdir_x(spd,dir)
var yspd = lengthdir_y(spd,dir)

with(par_enemy){
	mask_index = hit_mask
}

if !scr_move_collide(xspd,yspd,mask_index,par_enemy,true) || place_meeting(x,y,par_wall){
	
	var list = ds_list_create()
	
	collision_circle_list(x,y,16,par_enemy,true,true,list,false)
	
	for(var i = 0; i < ds_list_size(list); i++){
		scr_knockback_target(list[|i], global.guns[|gun_index].knockback, dir)
		list[|i].hp -= global.guns[|gun_index].damage
	}
	
	ds_list_destroy(list)
	
	scr_play_sound(snd_pop)
	instance_create_layer(x,y,layer,obj_pop)
	instance_destroy()
}


