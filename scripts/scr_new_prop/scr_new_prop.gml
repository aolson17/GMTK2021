





function new_body(_x,_y,_hit_dir, _body_spr,_spd,_image_xscale){
	var spd = _spd+random(_spd*.2)
	var dir = _hit_dir+choose(1,-1)*irandom(10)
	var xspd = lengthdir_x(spd,dir)
	var yspd = lengthdir_y(spd,dir)*.5
	
	scr_new_prop(_body_spr,_x,_y,xspd,yspd,.8,_image_xscale,make_color_hsv(0,0,100+irandom(55)),1)
}


function new_static_prop(_spr,_x,_y,_image_xscale,_col,_alpha){
	scr_new_prop(_spr,_x,_y,0,0,0,_image_xscale,_col,_alpha)
}

function scr_new_prop(_spr,_x,_y,_xspd,_yspd,_spd_factor,_image_xscale,_col,_alpha){
	var new_prop = instance_create_layer(_x,_y,"Instances",obj_prop)
	new_prop.sprite_index = _spr
	new_prop.image_xscale = _image_xscale
	new_prop.xspd = _xspd
	new_prop.yspd = _yspd
	new_prop.spd_factor = _spd_factor
	new_prop.image_alpha = _alpha
	new_prop.image_blend = _col
}