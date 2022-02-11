/// @function object_check_touch(Col?)
function object_check_touch(collisionType)
{	
	if !Player.AllowCollision
	{
		return false;
	}	
	
	switch collisionType
	{
		case ColHitbox: case ColHitbox2:
		{	
			// Exit if object can't be touched
			if !Obj_HitX or !Obj_HitY
			{
				return false;
			}
			if !object_is_onscreen(id)
			{
				return false;
			}
			
			// Get object's size
			var ObjectTop    = floor(y - Obj_HitY - 0);
			var ObjectLeft   = floor(x - Obj_HitX - 0);
			var ObjectRight  = floor(x + Obj_HitX - 1);
			var ObjectBottom = floor(y + Obj_HitY - 1);
		
			// Get player's normal hitbox
			if !(collisionType == ColHitbox2 and Player.DoubleSpinAttack)
			{
				var HitboxData = Player.HitboxData[0];
			}
				
			// Get double spin attack hitbox
			else
			{
				var HitboxData = Player.HitboxData[1];
			}
		
			// Check for overlap
			if HitboxData[2] < ObjectLeft or HitboxData[0] > ObjectRight
			{
				return false;
			}
			if HitboxData[3] < ObjectTop or HitboxData[1] > ObjectBottom
			{
				return false;
			}
			return true;
		}
		break;
		case ColSolidU: case ColSolidD: case ColSolidL: case ColSolidR:
		{
			// Exit if object can't be touched
			if !object_is_onscreen(id)
			{
				return false;
			}
			
			// Return touch flag
			switch collisionType
			{
				case ColSolidU:
					return Obj_SolidTouchU or Player.OnObject == id;
				break;
				case ColSolidD:
					return Obj_SolidTouchD;
				break;
				case ColSolidL:
					return Obj_SolidTouchL;
				break;
				case ColSolidR:
					return Obj_SolidTouchR;
				break;
			}
		}
		break;
		case ColSolidP:
		{
			// Exit if object can't be touched
			if !object_is_onscreen(id)
			{
				return false;
			}
			
			return Obj_SolidPush;
		}
		break;
		case ColTrigger:
		{
			return point_in_rectangle(floor(Player.PosX), floor(Player.PosY), floor(x + Obj_TriggerLeft), floor(y + Obj_TriggerTop), floor(x + Obj_TriggerRight - 1), floor(y + Obj_TriggerBottom - 1));
		}
		break;
	}
}