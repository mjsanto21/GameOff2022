/// @description 
var halfw = w * 0.5;

//Draw the Box
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_roundrect_ext(x-halfw-border,y-h-(border*2),x+halfw+border,y,15,15,false);
draw_sprite(sMarker,0,x,y);
draw_set_alpha(1);

//Draw Text

DrawSetText(c_white, fDiag, fa_center, fa_top);
draw_text(x,y-h-border,text_current);
