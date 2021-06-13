
#region Attributes to change in child

toggleable = false

text = "test"

button_w_override = -1 // For overriding automatic sizing
button_h_override = -1

// Example function
press_function = function(){
	var transition = instance_create_layer(x,y,"Cursor",obj_transition)
	transition.room_target = room
}

#endregion

toggle = false

y_offset = 0

alarm[0] = 1

/*
text_h = string_height(text)*2
text_w = string_width(text)*2

image_xscale = (text_w+20)/sprite_get_width(sprite_index)
image_yscale = (text_h+2)/sprite_get_height(sprite_index)

show_message(text_w+20)

//show_message(sprite_get_width(sprite_index))
//show_message(image_xscale)
