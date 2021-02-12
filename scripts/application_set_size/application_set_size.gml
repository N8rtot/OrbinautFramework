/// @function application_set_size(appWidth, appHeight)
function application_set_size(appWidth, appHeight)
{	
	// Set camera size
	camera_set_view_size(view_camera[0], appWidth, appHeight);
	
	// Set surface/viewport size
	surface_resize(application_surface,  appWidth, appHeight);
}