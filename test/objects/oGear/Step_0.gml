/// @description Insert description here
// You can write your code in this editor
x += horizontal_speed * dir;

if(x < position_from || x > position_to) 
{
	dir *= -1;	
}
image_speed = 0.5;

if (played == 0)
{
	//audio_stop_sound(seGearWhir);
	//audio_play_sound_at(seElecHum, 4960, 208, 0, 100, 300, 1, true, 1);
	audio_play_sound_on(s_emit, seGearWhir, true, 1, 0.3);
	played = 1;
}