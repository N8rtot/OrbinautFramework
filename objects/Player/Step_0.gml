/// @description Scripts
// You can call your scripts in this editor
	
	if keyboard_check(vk_space) exit;
	
	// Update player's states
	PlayerStatesUpdate();
	
	// Simulate how player behaviours when double input registered
	PlayerInputSimulation();
	
	// Run main code based on current state
	switch State 
	{
		case PlayerStateNormal:
		{	
			// Perform jump and exit the code
			if PlayerCheckJump() break;
			
			// Update slope angle
			PlayerSlopeAngle();
			
			// Set slope gravity
			PlayerSlopeResist();

			// Update player's speeds
			PlayerMove();
			
			// Collide with walls
			PlayerHitWalls();
			
			// Update player's position
			PlayerSpeedToPos();
			
			// Check for crossing stage boundaries
			PlayerLevelBound();
			
			// Perform spindash
			PlayerCheckSpindash();
			
			// Perform roll
			PlayerCheckRoll();
			
			// Collide with floor and update collision angle
			PlayerCollideFloor();

			// Fall off the ceiling and walls
			PlayerSlopeRepel();
			
			// Collide with the objects
			PlayerCollideSolidObjects();
			
			// Check for being hurt
			PlayerCheckHurt();
		}
		break;
		case PlayerStateRoll:
		{		
			// Perform jump and exit the code
			if PlayerCheckJump() break;
			
			// Update slope angle
			PlayerSlopeAngle();
			
			// Set slope gravity
			PlayerSlopeResist();	
			
			// Update player's speeds
			PlayerMoveRoll();

			// Collide with walls
			PlayerHitWalls();
			
			// Update player's position
			PlayerSpeedToPos();
			
			// Check for crossing stage boundaries
			PlayerLevelBound();
			
			// Collide with floor and update collision angle
			PlayerCollideFloor();
			
			// Fall off the ceiling and walls
			PlayerSlopeRepel();
			
			// Collide with the objects
			PlayerCollideSolidObjects();
			
			// Check for being hurt
			PlayerCheckHurt();
		}
		break;
		case PlayerStateAirborne:
		{
			// Limit jump height
			PlayerJumpResist();
			
			// Update player's speeds
			PlayerMoveAirborne();
			
			// Update player's position
			PlayerSpeedToPos();
			
			// Check for crossing stage boundaries
			PlayerLevelBound();
			
			// Apply gravity and rotation
			PlayerApplyGravity();
			
			// Collide with walls
			PlayerHitWalls();
			
			// Collide with floor
			PlayerHitFloor();
			
			// Collide with roof
			PlayerHitRoof();
			
			// Collide with solid objects
			PlayerCollideSolidObjects();
			
			// Check for being hurt
			PlayerCheckHurt();
			
			// Landing events
			PlayerResetOnFloor();
		}
		break;
	}