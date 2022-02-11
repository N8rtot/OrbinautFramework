function BackgroundSetup()
{
	switch room
	{	
		// Test Stage
		case Stage_TVZ:
		{
			// Add layers
			background_layer_add(0, tex_tvz_bg00);
			background_layer_add(1, tex_tvz_bg01);
			background_layer_add(2, tex_tvz_bg02);
			background_layer_add(3, tex_tvz_bg03);
			background_layer_add(4, tex_tvz_bg04);
			background_layer_add(5, tex_tvz_bg05);
			background_layer_add(6, tex_tvz_bg06);
			background_layer_add(7, tex_tvz_bg07);
			
			// Setup layers
			background_layer_setup(0, 0, 0,   0.45, 0.05, -0.5, 0, 0, 0,     false);
			background_layer_setup(1, 0, 20,  0.35, 0.05, -0.3, 0, 0, 0,     false);
			background_layer_setup(2, 0, 41,  0.25, 0.05, -0.1, 0, 0, 0,     false);
			background_layer_setup(3, 0, 59,  0.13, 0.05, 0,    0, 0, 0,     false);
			background_layer_setup(4, 0, 116, 0.15, 0.05, 0,    0, 0, 0,     false);
			background_layer_setup(5, 0, 144, 0.19, 0.05, 0,    0, 0, 0,     false);
			background_layer_setup(6, 0, 165, 0.19, 0.05, 0,    0, 1, 0.008, false);
			background_layer_setup(7, 0, 190, 0.6,  0.05, 0,    0, 0, 0,     false);
			
			// Set colour
			background_colour_set($004400);
		}
		break;
	}	
}