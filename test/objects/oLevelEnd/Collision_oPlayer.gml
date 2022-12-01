/// @description Move to next room (SET TARGET PLEASE)
//MAKE SURE YOU SET YOUR TARGET IN CREATION CODE
with (oPlayer)
{
	if (hascontrol)
	{
		hascontrol = false;
		SlideTransition(TRANS_MODE.GOTO,other.target);
	}
	
}

