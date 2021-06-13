/// @description Fall


//scr_play_sound(snd_collision,false)

//audio_sound_gain(sound,0,1500)

//xsp = image_xscale
//ysp = -3

ds_list_add(obj_effects.bouncy_effects,new bouncy_effect(spr_eyes_fall,x,y,y+25,choose(120,60), 1.5))
instance_destroy()

/*falling = true

grav_speed = 0.2

var sound = audio_play_sound(snd_taking_damage,0,0)
audio_sound_gain(sound,global.master_volume*global.sound_volume*.8,0)
//audio_sound_gain(sound,0,1500)


//xsp = lengthdir_x(3,global.grav_dir)
//ysp = lengthdir_y(3,global.grav_dir)