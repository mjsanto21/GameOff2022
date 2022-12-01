/// @description GUI/Vars/Menu setup
#macro SAVEFILE "Save.sav"


gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;

menu_x = gui_width-1400; //+200;
menu_y = gui_height - 200 - gui_margin;
menu_x_target = gui_width - 1400 - gui_margin;
menu_speed = 25; //lower is faster
menu_font = fNewMenu;
menu_itemheight = font_get_size(fNewMenu);
menu_committed = -1;
menu_control = true;

menu[3] = "New Game";
menu[2] = "Continue";
menu[1] = "Credits";
menu[0] = "Quit";

menu_items = array_length_1d(menu);
menu_cursor = 3;

