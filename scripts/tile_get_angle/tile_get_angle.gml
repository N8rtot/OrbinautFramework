/// @function tile_get_angle(index)
function tile_get_angle(index)
{
	// Return found angle
	var Tile = (index - 1) mod Game.TileData[1] + 1;
	if  Tile
	{
		return Game.TileAngle[Tile];
	}
	
	// If no tile found, return empty angle
	return noone;
}