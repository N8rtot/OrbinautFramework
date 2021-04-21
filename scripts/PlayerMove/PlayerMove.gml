function PlayerMove()
{	
	// Accelerate and decelerate
	if MovementLock == false
	{
		if Input.Left
		{	
			// If moving right and left key is pressed, decelerate
			if Inertia > 0 
			{
				Inertia -= Dec;
				if (Inertia <= 0) Inertia = -0.5;	
			} 
			
			// If moving left and left key is pressed, accelerate
			else
			{
				if (!Game.GroundSpeedcap and Inertia > -TopAcc) or Game.GroundSpeedcap
				{
					Inertia -= Acc;					
					if (Inertia <= -TopAcc) Inertia = -TopAcc;		
				} 
				Facing = DirLeft;
			}
		}
		if Input.Right
		{				
			// If moving left and right key is pressed, decelerate
			if Inertia < 0 
			{
				Inertia += Dec;
				if (Inertia >= 0) Inertia = 0.5;
			} 
			
			// If moving right and right key is pressed, accelerate
			else
			{
				if (!Game.GroundSpeedcap and Inertia < TopAcc) or Game.GroundSpeedcap
				{
					Inertia += Acc;
					if (Inertia >= TopAcc) Inertia = TopAcc;
				} 
				Facing = DirRight;
			}
		}
	}
	
	// Apply friction
	if (!Input.Left and !Input.Right and Inertia != 0) or MovementLock != false
	{
		if Inertia > 0
		{
			Inertia -= Acc;
			if (Inertia < 0) Inertia = 0;
		}
		else
		{
			Inertia += Acc;
			if (Inertia >= 0) Inertia = 0;
		}
	}
	
	// Check for skidding
	if !Skidding and abs(Inertia) > 4 and round(Angle/90) % 4 == RangeFloor and MovementLock == false
	{
		if Inertia > 0 and Input.Left
		{
			Skidding = DirRight;
		}
		if Inertia < 0 and Input.Right
		{
			Skidding = DirLeft;
		}
	}
	else
	{
		if (Inertia < 0 and Input.LeftPress) or (Inertia > 0 and Input.RightPress) or Inertia == 0 or sign(Skidding) != sign(Inertia)
		{
			Skidding = false;
		}
	}
	
	// Check for stop pushing
	if Pushing == DirRight and (!Input.Right or Player.Xsp < -1)
	or Pushing == DirLeft  and (!Input.Left  or Player.Xsp >  1)
	{
		Pushing = false;
	}
	
	// Check for stop balancing (balancing flag is set in floor collision)
	if Balancing != false and Inertia != 0
	{
		Balancing = false;
	}
	
	// Get our speed ratio
	AnimReservedSpeed = round(max(1, 8 - abs(Inertia)));

	// Convert inertia to normal axis speeds
	Xsp = Inertia *  dcos(Angle);
	Ysp = Inertia * -dsin(Angle);
	
	// Our default animation if AnimIdle
	Animation = AnimIdle;
		
	// Check if we're balancing to the right
	if Balancing == DirRight
	{
		Animation = AnimBalanceFront;
	}
	
	// Check if we're balancing to the left
	else if Balancing == DirLeft
	{
		Animation = AnimBalanceBack;
	}
		
	// Check if we're moving
	if Inertia != 0
	{
		// Check for walk
		if abs(Inertia) < 6
		{
			Animation = AnimWalk;
		}
		
		// Check for run
		else if abs(Inertia) < 10
		{
			Animation = AnimRun;
		}
		
		// Check for very fast run
		else
		{
			Animation = CharacterID == CharSonic ? AnimPeelout : AnimRun;
		}
	}
		
	// Check if we're skidding
	if Skidding != false
	{
		Animation = AnimSkid;
	}
	
	// Check if we're pushing
	if Pushing != false
	{
		Animation = AnimPush;
	}
}