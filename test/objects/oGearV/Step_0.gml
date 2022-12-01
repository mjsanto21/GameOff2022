/// @description Insert description here
// You can write your code in this editor
//x += horizontal_speed * dir;
y += vertical_speed * dir;

if(y < position_from || y > position_to) 
{
	dir *= -1;	
}
if (played == 0)
{
	audio_stop_sound(seWaterPipe);
	//audio_play_sound_at(seElecHum, 4960, 208, 0, 100, 300, 1, true, 1);
	audio_play_sound_on(s_emit1, seGearWhir, true, 1, 0.3);
	played = 1;
}