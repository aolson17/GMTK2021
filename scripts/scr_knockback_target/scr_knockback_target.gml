


function scr_knockback_target(_target,_spd,_dir){
	if !_target.knockback_immune{
		_target.state = states.knockback
	}
	
	_target.knockback_spd = _spd
	_target.knockback_dir = _dir
	
	if _target.object_index = obj_player{
		scr_play_sound(snd_hurt)
	}else{
		scr_play_sound(snd_enemy_hit)
	}
}


