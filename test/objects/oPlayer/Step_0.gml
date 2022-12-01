/// @description Core Player Logic
audio_listener_position(x, y, 0);

if (hascontrol)
{
	//Get player inputs
	key_left = keyboard_check(vk_left);
	key_right = keyboard_check(vk_right);
	key_jump = keyboard_check_pressed(vk_space);
	key_dash = keyboard_check_pressed(vk_shift);

	//Calculate movement
	var _move = key_right - key_left;

	//hsp = _move * walkspd;


	/*if (place_meeting(x+hsp,y,oWall))
	{
	
		while (!place_meeting(x+sign(hsp),y,oWall))
		{
			x = x + sign(hsp);
		}
		hsp = 0;
	}*/

	if (dashduration > 0) vsp = 0;
	else if (place_meeting(x-5,y,oWall)) or (place_meeting(x+5,y,oWall))
	{
		if (key_jump) && (place_meeting(x-5,y,oWall)) && (!place_meeting(x,y+5,oWall))
		{	
				walljumpduration = 15;
				vsp = -jumpspd;
				walljumpdir = 1;
				doubleJump = 0;
				jump_se = 0;
				doubleJump_sprite = 5;
			
		}
		if (key_jump) && (place_meeting(x+5,y,oWall)) && (!place_meeting(x,y+5,oWall))
		{
				walljumpduration = 15;
				vsp = -jumpspd;
				walljumpdir = -1;
				doubleJump = 0;
				jump_se = 0;
				doubleJump_sprite = 5;
		}
		if (jump_se == 0)
		{
			audio_play_sound(sePCJump, 5, false, 0.15);
			jump_se =1;
			
		}
		
		if (vsp > 0)
		{
			isOnWall=true;
			sprite_index = sRobotWallSlide3;
			//vsp = vsp + (grv/3);
			vsp = 4;
			slide_se = 0;
		}
		else 
		{
			isOnWall=false;
			audio_stop_sound(seWallSlideV);
			if (vsp < 13) 
			{
				vsp = vsp + grv;
			}
		}
	}

	else
	{
		isOnWall=false;
		slide_trigger = 0;
		audio_stop_sound(seWallSlideV);
		if (vsp < 13)
		{
			vsp = vsp + grv;
		}
		//vsp = vsp + grv;	
	}
	if (slide_se == 0 && slide_trigger == 0)
	{
		audio_play_sound(seWallSlideV, 5, true, 0.1);
		slide_se = 1;
		slide_trigger = 1;
	}
	//If the pixel BELOW the character is a wall & the jump key is pressed then jump
	if (place_meeting(x,y+1,oWall)) && (key_jump)
	{
		vsp = -jumpspd;
		jump_se = 0;
		
	}
	/*if (place_meeting(x,y+1,oPlatform)) && (key_jump)
	{
		vsp = -jumpspd;
	}*/
	//Double Jump? If you arent touching a wall, and you arent on the ground then jump
	if (!place_meeting(x,y+1,oWall)) && (key_jump) && (doubleJump==0) && (!place_meeting(x+5,y,oWall)) && (!place_meeting(x-5,y,oWall))
	{
		vsp = -jumpspd;
		doubleJump = 1;
		jump_se = 0;
		doubleJump_sprite = 5;
	}
	if (jump_se == 0)
	{
		audio_play_sound(sePCJump, 5, false, 0.15);
		jump_se = 1;
	}
	//Dash
	//Wtf happened here man
	//So If u press dash key & it's not on CD, then dash. It checks if your dash is active then dashes. 
	//Same with Walljump, if your walljump is active then move as if ur walljumping. These movements overwrite walking.
	dashdelay = max(dashdelay - 1, 0);
	dashduration = max(dashduration - 1, 0);
	if (key_dash) && (dashdelay == 0) && (airdash == 0)
	{
		sprite_index = sRobotDash;
		dashduration = 25;
		dashdelay = 60;
		airdash = 1;
		dash_se = 0;
	}
	if (dash_se == 0)
	{
		audio_play_sound(sePCDash, 5, false, 0.1)
		dash_se = 1;
	}
	if (dashduration > 0)
	{
		hsp = image_xscale * dashspd;
		dashduration = max(dashduration - 1, 0);
	}
	else if (walljumpduration > 0)
	{
		hsp = walljumpdir * 7;
		walljumpduration = max(walljumpduration - 1, 0);
	
	}
	/*else if (isOnPlatform)
	{
		var instance = instance_place(x, y + 1, oPlatform);
		if(instance != noone)
		{
			//This is where you'd fix platform speed
			isOnPlatform = true;
			hsp = (instance.horizontal_speed) * instance.dir;
		}
		else 
		{
			isOnPlatform = false;
		}*/	

	else
	{
		walljumpdir = 0;
		hsp = _move * walkspd;	
	}
}
else 
{
	key_right = 0;
	key_left = 0;
	key_jump = 0;
	key_dash = 0;
}

//Horizontal collision
if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
if (place_meeting(x+hsp,y,oWallSlick))
{
	while (!place_meeting(x+sign(hsp),y,oWallSlick))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
if (place_meeting(x+hsp,y,oCeiling))
{
	while (!place_meeting(x+sign(hsp),y,oCeiling))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
/*if (place_meeting(x+hsp,y,oPlatform))
{
	while (!place_meeting(x+sign(hsp),y,oPlatform))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}*/
x = x + hsp;
if (vsp > 9)
{
	in_air = 0;	
}
if (vsp > 13)
{
	in_air = 1;
	big_air = 0;
}


//Vertical collision with wall
if (place_meeting(x,y+vsp,oWall))
{	
	airdash = 0;
	doubleJump = 0;
	
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
	if (in_air == 0)
	{
		rand = random(2);
		switch (floor(rand))
			{
				case 0:
				audio_play_sound(seFallimpact1,5,false,0.3);
				in_air = 1;
				break;
				case 1:
				audio_play_sound(seFallImpact2,5,false,0.3);
				in_air = 1;
				break;
				case 2:
				audio_play_sound(seFallimpact3,5,false,0.3);
				in_air = 1;
				break;
			}	
				
		//show_debug_message("IMPACT");
	}
	if (big_air == 0)
	{
		audio_play_sound(seFallImpactBIG, 5, false, 0.05);
		big_air = 1;
		//show_debug_message("IMPACT");	
	}
}
if (place_meeting(x,y+vsp,oCeiling))
{	
	while (!place_meeting(x,y+sign(vsp),oCeiling))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
if (place_meeting(x,y+vsp,oWallSlick))
{	
	while (!place_meeting(x,y+sign(vsp),oWallSlick))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

//Vertical collision with platform
/*if (place_meeting(x,y+vsp,oPlatform))
{	
	airdash = 0;
	doubleJump = 0;
	while (!place_meeting(x,y+sign(vsp),oPlatform))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
	var instance = instance_place(x, y + 1, oPlatform);
	if(instance != noone)
	{
		isOnPlatform = true;
	}
	else {
		isOnPlatform = false;
	}
}*/
y = y + vsp;

//Animation~ if you aren't touching the grou nd THEN change sprite to air
//if you have downward momentum, set sprite to fall, if else then set sprite to upwards
 if (!place_meeting(x,y+1,oWall))
 {
	if (dashduration > 0)
	{
		sprite_index = sRobotDash;	
	}
	else
	{
		if (isOnWall == true)
		{
		 sprite_index = sRobotWallSlide3;	
		}
		else
		{
			sprite_index = sRobotJumpUp;
			image_speed = 0;
			if (vsp > 0)
			{
				if (place_meeting(x,y+50, oWall))
				{
					image_index = 4;
				}
				else image_index = 3;
			}
			else
			{
				if (doubleJump_sprite > 0)
				{
					sprite_index = sRobotDoubleJump;
					doubleJump_sprite = max(doubleJump_sprite  - 1, 0);
				}
				else 
				{
					image_index = 2;
				}
			}
		}
	}
 }
 //If you ARE touching the ground 
 //check if your horizontal movespeed is 0, if it is 0 play idle animation
 //if you are moving, set sprite to walking animation
 else 
 {
	if (hsp == 0)
	{	
		image_speed = 0.1
		sprite_index = sRobotIdleUp;
	}
	else
	{
		if (dashduration > 0)
		{
		sprite_index = sRobotDash;
		}
		else
		{
			image_speed = 0.3;
			sprite_index = sRobotRunUp;
		}
		//image_speed = 0.3;
		//sprite_index = sSmallRobotRun;
	}	

 }
 //Here it checks that you're moving, and if you're moving the sprite changes direction based on which way
 //if (hsp != 0) image_xscale = sign(hsp);
 /*if (isOnWall == true)
 {
		if (stored = 0)
		{
			image_xscale = -1;	
		}
		if (stored = 180)
		{
			image_xscale = 1;	
		}
 }*/
 //else here if no comment V
 if (hsp != 0) image_xscale = sign(hsp);
 
 
 //Stores the players facing direction
 if (hsp != 0)
		{
			dir = sign(hsp);
			if ( dir == 1)
			{
			 stored = 0;
			}
			if ( dir == -1)
			{
			 stored = 180;
			}
		}
if (global.checkpoint == true) && (layer_exists("Startup"))
{
	if (moved == 0)
	{
		moved = 1;
		x = 4430;
		y = 200;
		
	}
	
}
