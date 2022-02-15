function RendererDistortionProcess()
{
	if DistortionEffect == noone
	{
		return;
	}
	
	// Count time (basically, it is the speed of distortion effect)
	if  instance_exists(Stage) and Stage.UpdateObjects
	or !instance_exists(Stage) and Renderer.UpdateAnimations
	{
		DistortionTimer += 0.5;
	}
		
	// Set speed
	fx_set_parameter(DistortionEffect, "g_Time", DistortionTimer);
		
	// Set a vertical limit of the distortion effect on our screen
	switch DistortionBound
	{
		case 0:
			var Bound = 0;
		break;
		case 1:
			var Bound = 1;
		break;
		case 2:
			var Bound = global.Height - clamp(Camera.ViewY - Stage.WaterLevel + global.Height, 0, global.Height);
		break;
	}
	fx_set_parameter(DistortionEffect, "g_Bound", Bound);
}