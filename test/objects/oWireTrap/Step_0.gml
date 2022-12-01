/// @description Insert description here
// You can write your code in this editor
image_speed=0.083;
if (played == 0)
{
	//audio_stop_sound(seElecHum);
	//audio_play_sound_at(seElecHum, 4960, 208, 0, 100, 300, 1, true, 1);
	audio_play_sound_on(s_emit, seElecHum, true, 1, 0.1);
	played = 1;
}

