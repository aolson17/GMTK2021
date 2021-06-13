/// @function scr_move_collide(xspd,yspd)
/// @description Attempts to move the character while checking for collisions
/// @param {Int} xspd
/// @param {Int} yspd
/// @param {sprite_index} mask
/// @param {object_index} wall
/// @param {Boolean} strict Whether or not a successful move requires no obstructions
/// @return {Boolean} Success
function scr_move_collide(argument0, argument1, argument2, argument3, _strict) {

	var xspd_ = argument0
	var yspd_ = argument1
	var _mask = argument2
	var _wall = argument3

	var can_move = false
	
	var found_wall = false
	
	var prev_mask = mask_index
	mask_index = _mask

	if xspd_ != 0{
		if place_meeting(x+xspd_,y,_wall){
			found_wall = true
			if !place_meeting(x,y,_wall){ // Don't push or move at all  if somehow stuck
				
				while(!place_meeting(x+sign(xspd_),y,_wall)){
					x+=sign(xspd_)
				}
			}
		}else{
			can_move = true
			x+=xspd_
		}
	}

	if yspd_ != 0{
		if place_meeting(x,y+yspd_,_wall){
			found_wall = true
			if !place_meeting(x,y,_wall){ // Don't push or move at all if somehow stuck
				
				while(!place_meeting(x,y+sign(yspd_),_wall)){
					y+=sign(yspd_)
				}
			}
		}else{
			can_move = true
			y+=yspd_
		}
	}
	
	mask_index = prev_mask
	
	if found_wall{
		if object_index = obj_player{
			scr_play_sound(snd_collision,false)
		}
	}

	if can_move{
		if _strict && found_wall{
			return false
		}
		return true
	}else{
		return false
	}
}
