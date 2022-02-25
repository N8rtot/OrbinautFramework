/// @function object_set_depth(target,depthFlag)
function object_set_depth(target,depthFlag)
{
	// Apply depth relative to the player
	if target == Player
	{
		switch object_index
		{
			/* You can add your objects for more advanced depth 
			manipulation. Example: 
			
			case FloatingPlatform:
				var Tolerance = 25;
			break; */	
			
			case Bridge:
				var Tolerance = 5;
			break;
			case BridgePost:
				var Tolerance = 15;
			break;
			default:     
				var Tolerance = 10; 
		}
		depth = Player.depth - (depthFlag ? Tolerance : -Tolerance);
	}
	
	// Apply depth relative to another object
	else
	{
		depth = target.depth - (depthFlag ? 1 : -1);
	}
}