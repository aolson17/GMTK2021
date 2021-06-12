

depth = -y



if state = states.knockback{
	xspd = lengthdir_x(knockback_spd,knockback_dir)
	yspd = lengthdir_y(knockback_spd,knockback_dir)
		
	knockback_spd *= .8
		
	if !scr_move_collide(xspd,yspd,move_mask,par_solid,false) || knockback_spd < .2{
		state = states.normal
	}
}

#region Movement


moving = false
if can_move{
	if point_distance(x,y,target_x,target_y) >= move_spd{
		
		moving = true
		dir = point_direction(x,y,target_x,target_y)
		xspd = lengthdir_x(move_spd,dir)
		yspd = lengthdir_y(move_spd,dir)
	
		// Face the target
		if sign(target_x-x) != 0{
			image_xscale = sign(target_x-x)
		}
		
		move_success = scr_move_collide(xspd,yspd,move_mask,par_solid,false)
		if !move_success{
			moving = false
		}
	}else{
		// Move the rest of the way if there is anything considerable to move
		if point_distance(x,y,target_x,target_y) > .1{
			moving = true
			dir = point_direction(x,y,target_x,target_y)
			xspd = lengthdir_x(point_distance(x,y,target_x,target_y),dir)
			yspd = lengthdir_y(point_distance(x,y,target_x,target_y),dir)
	
			// Face the target
			if sign(target_x-x) != 0{
				image_xscale = sign(target_x-x)
			}
	
			move_success = scr_move_collide(xspd,yspd,move_mask,par_solid,false)
			if !move_success{
				moving = false
			}
		}
	}
}

#endregion
