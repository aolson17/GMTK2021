


#region Bouncy Effects

for(var i = 0; i < ds_list_size(bouncy_effects); i++){
	
	this_effect = bouncy_effects[|i]
	
	draw_sprite_ext(this_effect.spr,0,this_effect.x,this_effect.y,1,1,this_effect.angle,this_effect.col,1)
	
	this_effect.x += this_effect.xspd
	this_effect.y += this_effect.yspd
	this_effect.yspd += this_effect.grav
	
	
	// Bounce off of the ground
	if this_effect.y >= this_effect.ground{
		if this_effect.bounces <= 0{
			// Add it to the rest of the effects and remove from cases list
			ds_list_add(effects, new_effect_from_bouncy(this_effect))
			ds_list_delete(bouncy_effects,i)
			i--
			continue
		}else{
			// Bounce
			this_effect.y = this_effect.ground
			this_effect.yspd *= -random(1)*.7
			this_effect.xspd *= random(1)*.5
			this_effect.bounces -= 1
		}
	}
}

#endregion


#region Effects

for(var i = 0; i < ds_list_size(effects); i++){
	this_effect = effects[|i]
	
	draw_sprite_ext(this_effect.spr,0,this_effect.x,this_effect.y,1,1,this_effect.angle,this_effect.col,this_effect.alpha)
	
	this_effect.alpha -= .05
	if this_effect.alpha < 0{
		ds_list_delete(effects,i)
		i--
	}
}

#endregion

#region Moving Effects

for(var i = 0; i < ds_list_size(moving_effects); i++){
	this_effect = moving_effects[|i]
	
	draw_sprite_ext(this_effect.spr,0,this_effect.x,this_effect.y,1,1,this_effect.angle,this_effect.col,this_effect.alpha)
	
	this_effect.x += this_effect.xspd
	this_effect.y += this_effect.yspd
	this_effect.xspd *= this_effect.spd_factor
	this_effect.yspd *= this_effect.spd_factor
	
	if point_distance(0,0,this_effect.xspd,this_effect.yspd) < .4{
		// Add it to the rest of the effects and remove from moving list
		ds_list_add(effects, scr_effect_from_moving_effect(this_effect))
		ds_list_delete(moving_effects,i)
		i--
		continue
	}
}

#endregion


