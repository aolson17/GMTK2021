width = camera_get_view_width(view_get_camera(0))
height = camera_get_view_height(view_get_camera(0))


zoom = 1
zoom_width = width
zoom_height = height
zoom_target = zoom
zoom_spd_factor = .3

spd_factor = .1

target = obj_player
target_x = target.x
target_y = target.y

mouse_power = .1
aim_power = .1

x = target_x
y = target_y



shake = 0
camera = camera_create_view(x,y,width,height)

view_set_camera(0,camera)


surf_w = 384
surf_h = 216

ui_surf = -1
