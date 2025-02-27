function StageStartup()
{
	// Initialise variables
	EventTimer	= 0;
	IsFinished	= 0;
	IsPaused	= 0;
	IsGameOver	= 0;
	Time		= 0;
	TimeEnabled	= 0;
	DoUpdate	= 0;
	IsBossfight = -1;
	
	// Store current zone ID and room index
	Game.Stage     = ZoneID;
	Game.StageRoom = room;
	
	// Play stage music
	audio_bgm_play(ChannelPrimary, StageMusic);
	
	// Set bubble wobble data
	if WaterEnabled
	{
		WobbleData =
		[ 
		  0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2,
		  2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
		  3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2,
		  2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0,
		  0,-1,-1,-1,-1,-1,-2,-2,-2,-2,-2,-3,-3,-3,-3,-3,
		 -3,-3,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,
		 -4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-3,
		 -3,-3,-3,-3,-3,-3,-2,-2,-2,-2,-2,-1,-1,-1,-1,-1
		]
	}
	
	// Load saved data if loading into the stage from Bonus or Special Stage
	if array_length(Game.StarPostData)
	{
		Time		   = Game.StarPostData[2];
		BottomBoundary = Game.StarPostData[3];
	}
	if array_length(Game.SpecialRingData)
	{
		Time		   = Game.SpecialRingData[4];
		BottomBoundary = Game.SpecialRingData[5];
		
		// Clear array (Player has already restored their rings and barrier atm.)
		Game.SpecialRingData = [];
	}
	
	// Set stage boundaries
	TargetLeftBoundary   = LeftBoundary;
	TargetRightBoundary  = RightBoundary;
	TargetTopBoundary    = TopBoundary;
	TargetBottomBoundary = BottomBoundary;
	DeathBoundary        = BottomBoundary;
}