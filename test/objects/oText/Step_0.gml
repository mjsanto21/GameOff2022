/// @description Progress Text

letters += spd;
//floor seems very useful
text_current = string_copy(text,1,floor(letters));

draw_set_font(fDiag);
if (h == 0) h = string_height(text);
w = string_width(text_current);

//Destroy when done
if (letters >=length)
{
	audio_stop_sound(seMom);
	audio_stop_sound(seNun);
}
if (letters >= length) && (keyboard_check_pressed(vk_anykey))
{
	instance_destroy();
	with (oCamera) follow = oPlayer;
}