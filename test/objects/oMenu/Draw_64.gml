/// @description Draw Menu 

//draw functions set them for ALL DRAW FUNCTIONS until they are set again
//so if I draw again, then they will draw from this, so set them every time.

draw_set_font(fNewMenu);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

for (var i = 0; i < menu_items; i++)
{
	var offset = 2;
	var txt = menu[i];
	if (menu_cursor == i)
	{
		txt = string_insert("> ", txt, 0);
		var col = #FFF9A6;
	}
	else
	{
		var col = #85431E;
	}
	var xx = menu_x;
	var yy = menu_y - (menu_itemheight * (i*3.5));
	
	draw_set_color(c_black);
	draw_text(xx-offset,yy,txt);
	draw_text(xx+offset,yy,txt);
	draw_text(xx,yy-offset,txt);
	draw_text(xx,yy+offset,txt);
	draw_set_color(col);
	draw_text(xx,yy,txt);
}