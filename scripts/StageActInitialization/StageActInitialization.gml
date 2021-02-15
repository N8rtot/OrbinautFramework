function StageActInitialization()
{	
	switch room 
	{
		// Moonlight Base
		case MBZ:
			CardName				= "MOONLIGHT BASE";				// Level name
			BackgroundMusic			= MoonlightBase;				// Background music
			BackgroundDAC			= noone;						// DAC channel of bgm
			LoopStart				= 69.490;						// Music loop start point
			LoopEnd					= 125.120;						// Music loop end point			
			ZoneID					= 10;							// Zone ID, used for saving
			ActID					= 0;							// Act ID, used for displaying act number and saving
			CardEnabled				= true;							// Enable title card, else just fade in
			TimeEnabled				= false;						// Enable time counter right from the start
			Time					= 0;							// Default stage time upon loading
			WaterLevel				= 0;							// Water level (y position)
			LeftBoundary			= 0;							// Left stage limit
			TopBoundary				= 0;							// Top stage limit
			RightBoundary			= room_width;					// Right stage limit
			BottomBoundary			= room_height;					// Bottom stage limit
			State					= ActStateDefault;				// Stage state upon loading
		break;	
		
		// Moonlight Base 2
		case MBZ2:
			CardName				= "MOONLIGHT BASE";				// Level name
			BackgroundMusic			= MoonlightBase;				// Background music
			BackgroundDAC			= noone;						// DAC channel of bgm
			LoopStart				= 69.490;						// Music loop start point
			LoopEnd					= 125.120;						// Music loop end point			
			ZoneID					= 10;							// Zone ID, used for saving
			ActID					= 1;							// Act ID, used for displaying act number and saving
			CardEnabled				= true;							// Enable title card, else just fade in
			TimeEnabled				= false;						// Enable time counter right from the start
			Time					= 0;							// Default stage time upon loading
			WaterLevel				= 0;							// Water level (y position)
			LeftBoundary			= 0;							// Left stage limit
			TopBoundary				= 0;							// Top stage limit
			RightBoundary			= room_width;					// Right stage limit
			BottomBoundary			= room_height;					// Bottom stage limit
			State					= ActStateDefault;				// Stage state upon loading
		break;	
	}	
}