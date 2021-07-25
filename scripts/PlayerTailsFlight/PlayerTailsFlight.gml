function PlayerTailsFlight()
{
	if !FlightState
	{
		exit;
	}
	
	// Check if we're able to fly
	if FlightTimer
	{
		// Affect gravity
		if Ysp < -1
		{
			Grv = 0.03125;
		}
		else if Input.ABCPress
		{
			Grv = -0.125;
		}
		
		// Decrease timer
		FlightTimer--;
		
		// Set 'fly' or 'swim' animation
		Animation = IsUnderwater ? AnimSwim : AnimFly;
	}
	else
	{
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// Check if we're not flying yet
	if !FlyingState
	{	
		// Check if we're jumping and A, B or C button has been pressed
		if Jumping and (Input.APress or Input.BPress)
		{
			// Start flying
			Grv			= 0.03125;
			FlyingState = 1;
			FlyingTimer = 480;
			Jumping		= false;
			
			// Limit ysp
			if Ysp < -4
			{
				Ysp = -4;
			}
			
			// Use normal collision radiuses
			xRadius = xRadiusDefault;
			yRadius = yRadiusDefault;
		}
	}
	
	// Check if we're flying already
	else
	{	
		// Check if timer is higher than zero
		if FlyingTimer > 0
		{
			// Play sound
			if !IsUnderwater
			{
				audio_sfx_play(sfxFlying, true);
			}
			else
			{
				audio_sfx_stop(sfxFlying);
			}
			
			// Decrease timer
			FlyingTimer--;
				
			// Temporary decrease gravity if A, B or C button has been pressed
			if (Input.ABCPress) Grv = -0.125;
		
			// Increase gravity when moving upwards fast enough
			if (Ysp < -1) Grv = 0.03125;
			
			// Set 'fly' or 'swim' animation
			Animation = IsUnderwater ? AnimSwim : AnimFly;
			
			// Check fly cancel is enabled, and we pressed A, B or C while holding DOWN
			if Game.FlyingCancel and Input.Down and Input.ABCPress
			{
				// Stop sound
				audio_sfx_stop(sfxFlying);	
				
				// Use small collision radiuses
				xRadius = xRadiusRoll;
				yRadius = yRadiusRoll;
			
				// Leave flying state
				FlyingState	= false;
				FlyingTimer = 0;
				Grv		    = 0.21875;
				Rolling		= true;
				
				// Set 'roll' animation
				Animation   = AnimRoll;
				
				// Since we're going the into rolling state, rolling offset will be applied to the camera.
				// So let's correct its position
				Screen.RawY += xRadiusDefault - xRadiusRoll;
			}		
		}
		
		// Check if timer ran out
		else
		{					
			// Stop sound
			audio_sfx_stop(sfxFlying);	
			
			// Set 'tired' animation
			Animation = IsUnderwater ? AnimSwimTired : AnimFlyTired;
			
			// Enter tired state
			FlyingState = 2;
			Grv		    = 0.03125;
		}
		
		// Play tired sound
		if !IsUnderwater
		{
			if FlyingState == 2
			{
				audio_sfx_play(sfxTired, true);
			}
		}
		else
		{
			audio_sfx_stop(sfxTired);
		}
	}
}