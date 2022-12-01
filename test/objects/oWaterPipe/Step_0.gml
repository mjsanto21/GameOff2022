if (played == 0)
{
	audio_stop_sound(seWaterPipe);
	//audio_play_sound_at(seElecHum, 4960, 208, 0, 100, 300, 1, true, 1);
	audio_play_sound_on(s_emit, seWaterPipe, true, 1000, 0.1);
	played = 1;
}
/*
with (oPlayer)
{
	oWaterPipe.roomname = room_get_name(room);
	show_debug_message(oWaterPipe.roomname);

}
switch (roomname)
{
	case "RoomSewerEntrance":
	show_debug_message("pog");
	break;
	
	default:
	show_debug_message("stop");
	show_debug_message(roomname);
	audio_stop_sound(seWaterPipe);
	break
}*/