/// @description Gun following player
x = oPlayer.x+30;
y = oPlayer.y-20;

if (oPlayer.hsp != 0) image_xscale = (sign(oPlayer.hsp)/4);

//code for gun following mouse
//image_angle = point_direction(x,y,mouse_x,mouse_y);

//Setting firing delay and firing conditions
firingdelay = firingdelay - 1;
//if (mouse_check_button(mb_left)) && (firingdelay < 0)
if (keyboard_check(ord("Z"))) && (firingdelay < 0)
{
	firingdelay = 10;
	//Create a layer & a bullet
	//The with function takes an object from outside and lets you change it
	//Using it here to create a new bullet object and effect it
	//other. refers to the oGun Angle
	with (instance_create_layer(x,y,"Bullets",oBullet))
	{
		speed = 20;
		//Stores the direction of the player in the player object, then calls it to determine direction of bullets. This one was hard. :c
		//If the player is moving, shoot in the direction that they are moving
		//If the player is not moving check to see what direction they were last facing and shoot in that direction.
		
		/*if (oPlayer.hsp != 0)
		{
			dir = sign(oPlayer.hsp);
			if ( dir == 1)
			{
			 direction = 0;
			 oPlayer.stored = 0;
			}
			if ( dir == -1)
			{
			 direction = 180;
			 oPlayer.stored = 180;
			}
		}
		else
		{
			direction = oPlayer.stored;	
		}*/
		direction = oPlayer.stored;
		image_angle = direction;
		image_xscale -= 0.7;
		image_yscale -= 0.5;
	}
	
}