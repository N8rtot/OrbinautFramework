/// @function object_do_damage(isBadnik, isProjectile, instantKill)
function object_do_damage(isBadnik, isProjectile, instantKill)
{
	// Check if this object is Badnik
	if isBadnik
	{
		// Check if player can destroy Badnik
		if Player.InvincibilityBonus or Player.Jumping or Player.Rolling or Player.SpindashRev
		{
			// Delete Badnik
			instance_destroy(self);
			
			// Spawn explosion and play sound
			object_spawn(floor(x), floor(y), ExplosionFX);
			audio_sfx_play(sfxDestroy, false, false);
			
			// Make player bounce if they are airborne
			if !Player.Grounded
			{
				if floor(Player.PosY) < floor(y)
				{
					Player.Ysp = -Player.Ysp;
				}
				else
				{
					Player.Ysp -= 1 * sign(Player.Ysp);
				}
			}
			
			// Exit the script
			exit;
		}
	}
	
	// Exit if player can't be damaged
	if (Player.isInvincible or Player.Hurt) exit;
	
	/* If we managed to get at this point, damage player */
	
	// Reset player flags
	Player.Grounded	     = false;
	Player.OnObject	     = false;
	Player.Rolling		 = false;
	Player.Jumping		 = false;
	Player.FlyingState	 = false;
	Player.GlidingState  = false;
	Player.ClimbingState = false;
	
	// Check if player has no rings and barrier or should die instantly
	if !Player.Rings and !Player.ShieldType or instantKill
	{
		// Set 'death' animation
		Player.Animation = AnimDeath;
			
		// Disable collisions and camera
		Screen.CameraEnabled  = false;
		Player.AllowCollision = false;
		
		// Draw player above everything
		Player.DrawOrder = 0;
			
		// Perform movement
		Player.Inertia = 0;
		Player.Xsp	   = 0;
		Player.Ysp	   = -7;
		Player.Grv	   = 0.21875;
			
		// Enter death state
		Player.Death = true;
		
		// Play death sound (depending on what object is this)
		var deathSound = object_index == TripleSpikesV ? sfxDeathSpike : sfxDeath;
		audio_sfx_play(deathSound, false, true);
	}
		
	// Check if player has rings or barrier
	else
	{	
		// Set 'hurt' animation
		Player.Animation = AnimHurt;
			
		// Lose rings if we do not have active barrier
		if !Player.ShieldType
		{
			// Set default values we will use to spread rings
			var Dir = -1
			var Ang = 168.75
			var Spd = 4
			
			// Do for each ring (maximum of 32)
			for (var i = 0; i < min(Player.Rings, 32); i++) 
			{
				// Spawn ring
				var Created = object_spawn(floor(Player.PosX), floor(Player.PosY), Ring);
				if  i == 16 
				{ 
					Ang = 168.75; 
					Spd = 2;
				}
				
				// Set solidbox for the ring
				with Created
				{
					object_set_solidbox(8, 8);
				}
				
				// Set ring flags and speed
				Created.Physical      = true;
				Created.PickupTimeout = 64;
				Created.Xsp			  = Spd * dsin(Ang) * Dir;
				Created.Ysp			  = Spd * dcos(Ang);
				
				// Update direction and movement angle
				if Dir 
				{ 
					Ang -= 22.5;
				}
				Dir *= -1
			}
				
			// Update player's ring counter
			Player.Rings = 0;
			
			// Play sound
			audio_sfx_play(sfxRingLoss, false, true);
		}
			
		// Else just lose barrier if player has rings
		else
		{
			Player.ShieldType = 0;
		}

		// Perform movement
		Player.Ysp = -4;
		Player.Xsp =  2 * sign(Player.PosX - id.x);
		Player.Grv = 0.1875;
		
		// Enter hurt state
		Player.Hurt = true;
	}
}