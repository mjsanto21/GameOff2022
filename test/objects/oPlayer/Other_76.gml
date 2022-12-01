/// @description Footsteps
footstep_value = random(8);
if (prev_value == footstep_value)
{
	footstep_value = random(8);	
}
prev_value = footstep_value;

if (event_data[? "event_type"] == "sprite event") 
{
	switch(event_data[? "message"]) 
	{
		case "footstep":
			//Good code :)
			//show_debug_message("Footstep");
			switch (floor(footstep_value))
			{
				case 0:
				audio_play_sound(Footstep_2,5,false);
				break;
				
				case 1:
				audio_play_sound(Footstep_3,5,false);
				break;
				
				case 2:
				audio_play_sound(Footstep_4,5,false);
				break;
			
				case 3:
				audio_play_sound(Footstep_5,5,false);
				break;
				
				case 4:
				audio_play_sound(Footstep_6,5,false);
				break;
				
				case 5:
				audio_play_sound(Footstep_7,5,false);
				break;
				
				case 6:
				audio_play_sound(Footstep_8,5,false);
				break;
				
				case 7:
				audio_play_sound(Footstep_9,5,false);
				break;
				
				case 8:
				audio_play_sound(Footstep_9,5,false);
				break;
			}
			
			//audio_play_sound(Footstep_2,5,false);
			break;
			/*case "death":
			{
				audio_play_sound(sePCDeath,5,false);
				show_debug_message("death")
				break;	
			}*/
	}

}

