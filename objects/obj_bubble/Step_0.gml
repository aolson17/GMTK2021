

var xspd = lengthdir_x(spd,dir)
var yspd = lengthdir_y(spd,dir)


if !scr_move_collide(xspd,yspd,mask_index,par_wall,true){
	instance_create_layer(x,y,layer,obj_pop)
	instance_destroy()
}


