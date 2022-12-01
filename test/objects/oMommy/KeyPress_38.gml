/// @description Sheesh
if (point_in_circle(oPlayer.x,oPlayer.y,x,y,500)) && (!instance_exists(oText))
{
	if (done == 1)
	{
		text = "Cl-oser, little steel-cast angel. Cast thine toward a new g-oal.\n Recover the knowledge h-dden by the one whose gift is wasted in slothfulness.";
	}
	if (done == 2)
	{
		text = "Plumb the depths, little so-ldier, and fetch the rogue entity’s S-sss-elf to me.\nYou know where to f-ind it. Yes... w-sdom shall not be wasted on id-le minds.";
	}
	if (done == 3)
	{
		text = "The Apple,\nDoes not,\nFall Far,\nFrom the Tree."; 
	}
	with (instance_create_layer(x,y-128,"Instances",oText))
	{
		text = other.text;
		length = string_length(text);
	}
	with (oCamera)
	{
		follow = other.id;	
	}
	if (done = 3)
	{
		se_mom = 0;
	}
	if (done = 2)
	{
		done = 3;
		se_mom = 0;
	}
	if (done = 1)
	{
		done = 2;
		se_mom = 0;
	}
	if (done = 0)
	{
		done = 1;
		se_mom = 0;
	}
	if (se_mom == 0)
	{
		audio_play_sound(seMom, 5, false, 0.4);
		se_mom = 1;
	}
}
