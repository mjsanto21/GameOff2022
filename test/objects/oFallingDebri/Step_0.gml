

/*with (instance_create_layer(x,y,"Debri",oFallingDebri))
	{
		vspeed = 5;
	}
*/
if (y > room_height)
{
	instance_destroy();	
}