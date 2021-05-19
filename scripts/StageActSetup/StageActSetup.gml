function StageActSetup()
{	
	// Setup stage properties
	switch room 
	{	
		// Moonlight Quadrant 1
		case MQZ1:
		{
			CardNameTop				= "MOONLIGHT";	
			CardNameBottom			= "QUADRANT";	
			ZoneID					= 0;
			ActID					= 0;
			FinalActID			    = 1;
			CardEnabled				= true;
			TimeEnabled				= false;
			Time					= 0;
			WaterLevel				= 1550;
			LeftBoundary			= 0;
			TopBoundary				= 0;
			RightBoundary			= room_width;
			BottomBoundary			= room_height;
			State					= ActStateLoading;
			StageMusic				= MoonlightQuadrant;
			StageMusicDAC			= noone;
			LoopStart				= 0;
			LoopEnd					= 277.01;
		}
		break;
		
		// Undentified Zone
		default:
		{
			CardNameTop				= "UNDENFITIED";	
			CardNameBottom			= "";
			ZoneID					= -1;
			ActID					= 0;
			FinalActID				= 1;
			CardEnabled				= true;
			TimeEnabled				= false;
			Time					= 0;
			WaterLevel				= room_height;
			LeftBoundary			= 0;
			TopBoundary				= 0;
			RightBoundary			= room_width;
			BottomBoundary			= room_height;
			State					= ActStateLoading;
			StageMusic				= noone;
			StageMusicDAC			= noone;
			LoopStart				= 0;
			LoopEnd					= 0;
		}
		break;
	}	
}