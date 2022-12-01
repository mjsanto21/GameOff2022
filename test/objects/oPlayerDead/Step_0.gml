/// @description Insert description here
// You can write your code in this editor

x = x + hsp;
y = y + vsp;

//How does this account for one direction?
//hsp = max(hsp - 0.5, 0);
//vsp = min(vsp + 0.5, 0);
//...?

if (image_index >= image_number -1)
{
	SlideTransition(TRANS_MODE.GOTO,room);
	image_speed = 0;
}


/*if (image_index > 13 & image_index < 14)
{
	done = 1;
	alarm[0] = 30;
}
*/
if (done == 1)
{
	//SlideTransition(TRANS_MODE.GOTO,room);	
}