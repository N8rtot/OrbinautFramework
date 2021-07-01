function PlayerHitWalls()
{	
	// Do not collide if we're not allowed to
	if !AllowCollision or (Grounded and Angle > 90 and Angle < 270)
	{
		exit;
	}
	
	// Update wall angle quadrant
	if Angle >= 0 and Angle < 45 or Angle > 315 and Angle <= 360	
	{
		// 0.0 ~ 44.9 | 360.0 ~ 314.9
		AngleQuadWall = RangeFloor;
	}
	else if Angle >= 45 and Angle < 136			
	{
		// 45.0 ~ 135.9
		AngleQuadWall = RangeRWall;
	}
	else if Angle >= 136 and Angle < 225		
	{
		// 136.0 ~ 224.9
		AngleQuadWall = RangeRoof;
	}
	else if Angle >= 225 and Angle <= 315		
	{
		// 225.0 ~ 315.0
		AngleQuadWall = RangeLWall;
	}
	
	// Left wall collision
	if Grounded
	{
		if Inertia < 0
		{
			// Collide with walls based on current angle range, frame ahead
			switch AngleQuadWall
			{
				case RangeFloor:
				{	
					var tileData = tile_check_collision_h(floor(PosX + Xsp - 10), floor(PosY + Ysp + 8 * (Angle == 360)), false, true, Layer);
					if  tileData[0] < 0 
					{	
						// Affect player speeds
						Xsp    -= tileData[0];
						Inertia = 0;
						
						// Set flag
						Pushing = DirLeft;
					}		
				}
				break;
				case RangeRWall:
				{
					var tileData = tile_check_collision_v(floor(PosX + Xsp), floor(PosY + Ysp + 10), true, true, Layer)
					if  tileData[0] < 0
					{
						// Affect player speeds
						Ysp  += tileData[0];
						
						// We're colling with floor in this case. Update angle
						Angle   = tileData[1];
						AngleQuadFloor = RangeFloor;
						
						// Reset speed
						Inertia = 0;
					}
				}
				break;
				case RangeRoof:
				{	
					var tileData = tile_check_collision_h(floor(PosX + Xsp + 10), floor(PosY + Ysp), true, true, Layer)
					if  tileData[0] < 0
					{	
						// Affect player speeds
						Xsp    += tileData[0];
						Inertia = 0;
					}
				}
				break;
				case RangeLWall:
				{
					var tileData = tile_check_collision_v(floor(PosX + Xsp), floor(PosY + Ysp - 10), false, true, Layer)
					if  tileData[0] < 0
					{	
						// Affect player speeds
						Ysp    -= tileData[0];
						Inertia = 0;
					}
				}
				break;
			}
		}
	}
	else if !(Xsp > abs(Ysp))
	{		
		// Collide airborne at the current frame
		var tileData = tile_check_collision_h(floor(PosX - 10), floor(PosY), false, true, Layer);
		if  tileData[0] < 0
		{
			PosX -= tileData[0];
			Xsp   = 0;
		}
	}
	
	// Right wall collision
	if Grounded
	{
		if Inertia > 0
		{
			// Collide with walls based on current angle range, frame ahead
			switch AngleQuadWall
			{
				case RangeFloor:
				{	
					var tileData = tile_check_collision_h(floor(PosX + Xsp + 10), floor(PosY + Ysp + 8 * (Angle == 360)), true, true, Layer);
					if  tileData[0] < 0
					{	
						// Affect player speeds
						Xsp    += tileData[0];
						Inertia = 0;
						
						// Set flag
						Pushing = DirRight;
					}
				}
				break;
				case RangeRWall:
				{
					var tileData = tile_check_collision_v(floor(PosX + Xsp), floor(PosY + Ysp - 10), false, true, Layer)
					if  tileData[0] < 0
					{	
						// Affect player speeds
						Ysp    -= tileData[0];
						Inertia = 0;
					}
				}
				break;
				case RangeRoof:
				{	
					var tileData = tile_check_collision_h(floor(PosX + Xsp - 10), floor(PosY + Ysp), false, true, Layer)
					if  tileData[0] < 0
					{	
						// Affect player speeds
						Xsp    -= tileData[0];
						Inertia = 0;
					}
				}
				break;
				case RangeLWall:
				{
					var tileData = tile_check_collision_v(floor(PosX + Xsp), floor(PosY + Ysp + 10), true, true, Layer)
					if  tileData[0] < 0
					{	
						// Affect player speeds
						Ysp += tileData[0];
						
						// We're colling with floor in this case. Update angle
						Angle	   = tileData[1];
						AngleQuadFloor = RangeFloor;
						
						// Reset speed
						Inertia = 0;
						
					}
				}
				break;
			}
		}
	}
	else if !(-Xsp > abs(Ysp))
	{	
		// Collide airborne at the current frame
		var tileData = tile_check_collision_h(floor(PosX + 10), floor(PosY), true, true, Layer);	
		if  tileData[0] < 0
		{
			PosX += tileData[0];
			Xsp   = 0;
		}
	}
}