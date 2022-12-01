/// @description SE?

on_timer = max(on_timer - 1, 0);
if (on_timer == 0)
{
	sprite_index = sVerticalElecTrap;
	on_timer = on_timer_initial;
	elec_on = 1;
	played = 0;
}
if (on_timer == 100)
{
	sprite_index = sVerticalElecTrapOff;
	elec_on = 0;
}

if (played == 0)
{
	//audio_stop_sound(seElecHum);
	//audio_play_sound_at(seElecHum, 4960, 208, 0, 100, 300, 1, true, 1);
	audio_play_sound_on(s_emit, seElecHum3, true, 1, 0.1);
	played = 1;
}
if (elec_on == 0)
{
	audio_stop_sound(seElecHum3);
}




