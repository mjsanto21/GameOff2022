/// @description Insert description here
// You can write your code in this editor
if (spawn_debri_timer == 0)
{
	spawn_debri_timer = spawn_debri_initial;
	with (instance_create_layer(x,y,"Debri",oFallingDebri))
	{
		vspeed = 10;
	}
}
spawn_debri_timer = max(spawn_debri_timer - 1, 0);

