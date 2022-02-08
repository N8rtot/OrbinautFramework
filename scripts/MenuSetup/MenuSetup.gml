function MenuSetup()
{
	/* List of the first acts of each zone in their gameplay order. 
	Use 'noone' to fill the blank zones */
	ZoneOrder =
	[
		Stage_TVZ,
		noone,
		noone,
		noone
	];
	StartStage = Stage_TVZ;
	
	// Stage Select
	menu_add_header(4,    "SELECT A STAGE");
	menu_add_option(4, 0, "TEST VALLEY", Stage_TVZ);
	menu_add_option(4, 1, "- -",		 noone);
	menu_add_option(4, 2, "- -",		 noone);
	menu_add_option(4, 3, "- -",		 noone);
	menu_add_option(4, 4, "- -",		 noone);
	
	// Screen select
	menu_add_header(5,    "SELECT A SCREEN");
	menu_add_option(5, 0, "SPLASH",   Screen_Splash);
	menu_add_option(5, 1, "CONTINUE", Screen_Continue);
	menu_add_option(5, 2, "- -",	  noone);
	menu_add_option(5, 3, "- -",	  noone);
	menu_add_option(5, 4, "- -",	  noone);
	
	#region Other
	{
		// Main Menu
		menu_add_header(0,    "ORBINAUT FRAMEWORK" + "\n\nDEVELOPER MENU");
		menu_add_option(0, 0, "GAME START",   1);
		menu_add_option(0, 1, "SCENE SELECT", 3);
		menu_add_option(0, 2, "OPTIONS",      6);	
		menu_add_option(0, 3, "EXIT GAME",    noone);
	
		// Game Start
		menu_add_header(1,    "SELECT A SAVE FILE");
		menu_add_option(1, 0, "NO SAVE MODE",		  3);
		menu_add_option(1, 1, string(DisplayData[0]), 3);
		menu_add_option(1, 2, string(DisplayData[1]), 3);
		menu_add_option(1, 3, string(DisplayData[2]), 3);
		menu_add_option(1, 4, string(DisplayData[3]), 3);
		menu_add_option(1, 5, "DELETE SAVE",		  7);
	
		// Scene Select
		menu_add_header(2,    "SELECT SCENE TYPE");
		menu_add_option(2, 0, "STAGE",  4);
		menu_add_option(2, 1, "SCREEN", 5);
	
		// Character Select (automatically, it should redirect to Stage Select)
		menu_add_header(3,    "SELECT A PLAYER");
		menu_add_option(3, 0, "SONIC",	  2);
		menu_add_option(3, 1, "TAILS",	  2);
		menu_add_option(3, 2, "KNUCKLES", 2);
	
		// Options
		menu_add_header(6,    "OPTIONS");
		menu_add_option(6, 0, "FULLSCREEN: ",   noone);
		menu_add_option(6, 1, "WINDOW SIZE: ",  noone);
		menu_add_option(6, 2, "SOUND VOLUME: ", noone);
		menu_add_option(6, 3, "MUSIC VOLUME: ", noone);
	
		// Game Start (delete data)
		menu_add_header(7,    "SELECT A SAVE FILE TO DELETE");
		menu_add_option(7, 0, "SLOT 1", noone);
		menu_add_option(7, 1, "SLOT 2", noone);
		menu_add_option(7, 2, "SLOT 3", noone);
		menu_add_option(7, 3, "SLOT 4", noone);
	}
	#endregion
}