/// @description Update camera

//Update destination
if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
	
	if ((follow).object_index == oPlayerDead)
	{
		x = xTo;
		y = yTo;
	}
	
}

//Update object position
x += (xTo - x) / 25;
y += (yTo - y) / 25;


x = clamp(x, view_w_half, room_width-view_w_half);
y = clamp(y, view_h_half, room_height-view_h_half);

//Update camera view
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);


if (layer_exists("Bridge_BackgroundClouds"))
{
	layer_x("Bridge_backgroundClouds", lerp(0,camera_get_view_x(view_camera[0]),.5));	
}
if (layer_exists("Bridge_Middleground"))
{
	layer_x("Bridge_Middleground", lerp(0,camera_get_view_x(view_camera[0]),.3));	
}
if (layer_exists("Bridge_Middleground_2"))
{
	layer_x("Bridge_Middleground_2", lerp(0,camera_get_view_x(view_camera[0]),.25));	
}


