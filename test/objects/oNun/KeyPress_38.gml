/// @description Sheesh
if (point_in_circle(oPlayer.x,oPlayer.y,x,y,128)) && (!instance_exists(oText))
{
	if ( done == 1) 
	{
		text = "..sniff";
		se_nun = 0;
	}
	with (instance_create_layer(x,y-128,layer,oText))
	{
		text = other.text;
		length = string_length(text);
	}
	with (oCamera)
	{
		follow = other.id;	
	}
	done = 1;
	if (se_nun == 0)
	{
		audio_play_sound(seNun, 5, false, 0.05);
		se_nun = 1;
	}
}
