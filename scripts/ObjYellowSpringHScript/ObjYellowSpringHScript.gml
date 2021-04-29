function ObjYellowSpringHScript()
{
	// Do collision
	object_do_collision(SolidAll, false);
	
	// Define launch side
	var launchSide = image_xscale ? SideRight : SideLeft;
	
	// Check if we're touching launch side
	if Player.Grounded
	{
		if object_player_touch(launchSide)
		{
			// Launch player
			Player.MovementLock = 16;
			Player.Facing		= image_xscale;	
			Player.Xsp			= image_xscale * 10;
			Player.Inertia		= Player.Xsp;
			
			// Play sound
			audio_sfx_play(sfxSpring, false, true);
			
			// Exit the script
			exit;
		}
	}
}