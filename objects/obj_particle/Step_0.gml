


var dir = point_direction(x,y,target_x,target_y)
var dis = point_distance(x,y,target_x,target_y)



x += lengthdir_x(spd,dir)
y += lengthdir_y(spd,dir)

if dis < 10{
	instance_destroy()
}