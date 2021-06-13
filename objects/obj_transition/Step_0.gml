/// @description Control effect opacity

incrementor++
if fade_out{
	opacity = incrementor/fade_ticks
}else{
	opacity = (1-incrementor/fade_ticks)+1
}

