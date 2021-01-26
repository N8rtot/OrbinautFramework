function GameMacroInitialization()
{		
	// Game macros
	#macro Game  global
	#macro to    0
	#macro from  1
	#macro black 0
	#macro white 1
	#macro flash 2
	
	// Player sensor macros
	#macro FloorL 0
	#macro FloorR 1
	#macro RoofL  2
	#macro RoofR  3
	#macro WallL  4
	#macro WallR  5	
	#macro xPos	  0
	#macro yPos	  1
	#macro Ang	  2
	#macro Dist	  3
	
	// Player macros
	#macro ModeFloor	       0
	#macro ModeWallR	       1
	#macro ModeRoof			   2
	#macro ModeWallL		   3	
	#macro PlayerStateNormal   0
	#macro PlayerStateRoll     1
	#macro PlayerStateAirborne 2
	#macro CharSonic		   0
	#macro CharTails	       1
	#macro CharKnuckles	       2	
	#macro FacingLeft	      -1
	#macro FacingRight	       1
	#macro LayerA		       0
	#macro LayerB		       1
	#macro AnimIdle		       0
	#macro AnimWalk		       1
	#macro AnimRun		       2
	#macro AnimPeelout	       3
	#macro AnimRoll			   4
	#macro AnimPush			   5
	#macro AnimSpindash		   6
	#macro AnimCrouch		   7
	#macro AnimLookup		   8
	
	// Stage macros
	#macro ActStateDefault   0
	#macro ActStateFinished  1
	#macro ActStateBossfight 2
	#macro ActStateAfterboss 3
	
	// Object macros
	#macro SolidAll 0
	#macro SolidTop 1	
}