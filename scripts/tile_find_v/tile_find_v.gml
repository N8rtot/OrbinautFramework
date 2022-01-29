/// @function tile_find_v(x,y,toPositive,ignoreTop,tilelayer)
function tile_find_v(x,y,toPositive,ignoreTop,tilelayer)
{	
	x = floor(x);
	y = floor(y);
	
	// Subtract 1 if we're not the player
	if toPositive and object_index != Player
	{
		x--;
		y--;
	}
	
	// Exit if outside of the room
	if x <= 0 or y <= 0 or x >= room_width or y >= room_height 
	{
		return [32, noone];
	}
	
	var Direction = toPositive ? 1 : -1;
	var Shift     = 0;
	
	// Get tile at position
	var Layer	   = Game.TileLayers[tilelayer];
	var Tile       = tilemap_get(Layer, x div 16, y div 16);
	var TileIndex  = tile_get_index(Tile);
	var TileHeight = tile_get_height(x, Tile, TileIndex);
	
	// If no height found, get a tile away from the player
	if !TileHeight
	{
		Shift		= 16;
		Tile	    = tilemap_get(Layer, x div 16, (y + Shift * Direction) div 16);
		TileIndex   = tile_get_index(Tile);
		TileHeight  = tile_get_height(x, Tile, TileIndex);
	}
	
	// If height found is 16px, try to find a tile closer to the player
	else if TileHeight == 16
	{
		Shift		= -16;
		Tile        = tilemap_get(Layer, x div 16, (y + Shift * Direction) div 16);
		TileIndex   = tile_get_index(Tile);
		TileHeight  = tile_get_height(x, Tile, TileIndex);
		
		// If no height found, revert back to the previous tile	
		if !TileHeight
		{
			Shift		= 0;
			Tile        = tilemap_get(Layer, x div 16, y div 16);
			TileIndex   = tile_get_index(Tile);
			TileHeight  = tile_get_height(x, Tile, TileIndex);
		}
	}
	
	// Exit if tile is top-only and we're ignoring them or it is below the room
	if ignoreTop and TileIndex > Game.TileData[1] or (y + Shift * Direction) & -16 >= room_height
	{
		return [32, noone];
	}
	
	// Calculate distance to edge of the found tile
	if toPositive
	{
		var TileDistance = ((y + Shift * Direction) & -16) + (16 - TileHeight - 1) - y;
	}
	else
	{
		var TileDistance = y - (((y + Shift * Direction) & -16) + TileHeight);
	}
	
	
	// Get angle
	var TileAngle  = tile_get_angle(TileIndex);
	if  TileAngle != 360
	{
		if tile_get_flip(Tile)
		{
			TileAngle = (540 - TileAngle) mod 360;
		}
		if tile_get_mirror(Tile)
		{
			TileAngle = 360 - TileAngle;
		}
	}
	else
	{
		TileAngle = toPositive ? 360 : 180;
	}
	
	// Return data
	return [TileDistance, TileAngle];
}