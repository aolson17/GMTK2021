


function scr_knockback_target(_target,_spd,_dir){
	if !_target.knockback_immune{
		_target.state = states.knockback
	}
	
	_target.knockback_spd = _spd
	_target.knockback_dir = _dir
}


