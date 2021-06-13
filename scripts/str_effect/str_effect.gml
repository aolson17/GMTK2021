


function new_blood(_x,_y,_hit_dir){
	var spd = 1+random(5)
	var dir = _hit_dir+choose(1,-1)*irandom(40)
	var xspd = lengthdir_x(spd,dir)
	var yspd = lengthdir_y(spd,dir)
	
	// Pick a random blood splatter sprite with controlled chance
	var spr_chance = irandom(100)
	if spr_chance < 60{
		var spr = spr_blood_tiny
	}else if spr_chance < 80{
		var spr = spr_blood_small
	}else{
		var spr = spr_blood_med
	}
	
	return new moving_effect(spr,_x,_y,xspd,yspd,.7,90+dir+choose(1,-1)*irandom(20),make_color_hsv(0,0,100+irandom(155)),.5+random(.5))
}

// An effect that will stay in one place until deleted
function effect( _spr, _x, _y, _angle, _col, _alpha) constructor {
	spr = _spr
	x = _x
	y = _y
	angle = _angle
	col = _col
	alpha = _alpha
}

// A bouncy effect
function bouncy_effect( _spr, _x, _y, _ground, _dir, _spd) constructor {
	spr = _spr
	xspd = lengthdir_x(_spd,_dir)*1.2
	yspd = lengthdir_y(_spd,_dir)
	x = _x
	y = _y
	grav = .2
	angle = irandom(360)
	col = make_color_hsv(0,0,230+irandom(25))
	ground = _ground-3+irandom(6)
	bounces = 2
}

function new_effect_from_bouncy(_bouncy_effect){
	return new effect(_bouncy_effect.spr,_bouncy_effect.x,_bouncy_effect.y,_bouncy_effect.angle,_bouncy_effect.col,1)
}

// An effet moving in a simple direction that slows over time. Will then be converted into normal effect
function moving_effect( _spr, _x, _y, _xspd, _yspd, _spd_factor, _angle, _col, _alpha) constructor {
	spr = _spr
	x = _x
	y = _y
	xspd = _xspd
	yspd = _yspd
	spd_factor = _spd_factor
	angle = _angle
	col = _col
	alpha = _alpha
}

// Returns an effect struct mimicing a giving moving effect struct
function scr_effect_from_moving_effect(_effect){
	return new effect(_effect.spr,_effect.x,_effect.y,_effect.angle,_effect.col,_effect.alpha)
}

