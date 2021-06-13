
depth = -y

// Just move until spd_factor stops it

if xspd != 0 || yspd != 0{
	if point_distance(0,0,xspd,yspd) < .4{
		xspd = 0
		yspd = 0
	}else{
		x += xspd
		y += yspd

		xspd *= spd_factor
		yspd *= spd_factor
	}
}
