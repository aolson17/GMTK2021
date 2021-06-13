


function scr_knockback_target(_target,_spd,_dir){
	
	
	_target.knockback_spd = _spd
	_target.knockback_dir = _dir
	
	if _target.object_index = obj_player{
		if obj_player.state = states.grapple || obj_player.state = states.grapple_shoot{
			exit
		}
		if obj_player.state = states.reload{ // Finish the reload if it interrupts it
			obj_player.current_ammo = global.guns[|obj_player.selected_gun].max_ammo
		}
		scr_play_sound(snd_hurt)
	}else{
		scr_play_sound(snd_enemy_hit)
	}
	
	if !_target.knockback_immune{
		_target.state = states.knockback
	}
}


